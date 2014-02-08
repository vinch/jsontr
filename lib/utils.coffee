'use strict'

module.exports.resultFilepath = (filepath, method) ->
  return filepath.substr(0, filepath.lastIndexOf('.')) + '.' + method + '.json'