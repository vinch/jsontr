fs = require 'fs'
jsontr = require '../lib/jsontr'
utils = require '../lib/utils'

args = process.argv.slice(2)

if args.length < 2
  console.log 'Provide the method and the path to a JSON file.'
else
  method = args[0]
  filepath = args[1]
  if method != 'flatten' && method != 'unflatten'
    console.log 'Possible methods are "flatten" and "unflatten".'
  else if !fs.existsSync(filepath)
    console.log 'File "' + filepath + '" does not exist.'
  else if fs.statSync(filepath).isDirectory()
    console.log '"' + filepath + '" is a directory.'
  else
    fs.readFile filepath, 'utf8', (err, data) ->
      throw err if err
      try
        data = JSON.parse data
      catch
        return console.log 'File "' + filepath + '" is not a valid JSON file.'
      resultFilepath = utils.resultFilepath filepath, method
      fs.writeFile resultFilepath, JSON.stringify(jsontr[method](data), undefined, 2), (err) ->
        throw err if err
        console.log 'File has been saved to "' + resultFilepath + '".'