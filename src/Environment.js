const nunjucks = require('nunjucks')
const nunjucksloader = require("../Nunjucks.Loader")

exports.render = function (env) {
  return function (template) {
    return function (context) {
      return function () {
        return env.render(template, context)
      }
    }
  }
}
exports.defaultEnvironment = new nunjucks.Environment();

exports.makeEnvironment = function (loaders) {
  return function (opts) {
    const newLoaders = loaders.map(function (l) {
      if (l instanceof nunjucksloader.WebLoader) {
        return new nunjucks.WebLoader(l.value0, l.value1)
      }
      if (l instanceof nunjucksloader.FileSystemLoader) {
        return new nunjucks.FileSystemLoader(l.value0, l.value1)
      }
      if (l instanceof nunjucksloader.NodeResolveLoader) {
        return new nunjucks.NodeResolveLoader(l.value0)
      }
    })
    return new nunjucks.Environment(newLoaders, opts)
  }
}
// exports.makeFileSystemLoader = function (paths) {
//   return function (opts) {
//     return new nunjucks.FileSystemLoader(paths, opts)
//   }
// }

// exports.makeNodeResolveLoader = function (opts) {
//   return new nunjucks.NodeResolveLoader(opts)
// }

// exports.makeWebLoader = function (url) {
//   return function (opts) {
//     return new nunjucks.WebLoader(url, opts)
//   }
// }
