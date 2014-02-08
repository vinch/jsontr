'use strict'

module.exports.flatten = (data) ->
  recurse = (cur, prop) ->
    if Object(cur) isnt cur
      result[prop] = cur
    else if Array.isArray(cur)
      i = 0
      l = cur.length
      while i < l
        recurse cur[i], prop + '[' + i + ']'
        i++
      result[prop] = []  if l is 0
    else
      isEmpty = true
      for p of cur
        isEmpty = false
        recurse cur[p], (if prop then prop + "." + p else p)
      result[prop] = {}  if isEmpty and prop
    return
  result = {}
  recurse data, ''
  return result

module.exports.unflatten = (data) ->
  return data if Object(data) isnt data or Array.isArray(data)
  regex = /\.?([^.\[\]]+)|\[(\d+)\]/g
  resultholder = {}
  for p of data
    cur = resultholder
    prop = ''
    m = undefined
    while m = regex.exec(p)
      cur = cur[prop] or (cur[prop] = ((if m[2] then [] else {})))
      prop = m[2] or m[1]
    cur[prop] = data[p]
  resultholder[''] or resultholder