function npkgv --description "Get the version of an npm package in the current directory"
  node -p "r=require('./package.json'); r.devDependencies['$argv[1]'] || r.dependencies['$argv[1]']" 2>/dev/null
end
