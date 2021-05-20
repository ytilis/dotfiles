function nmodv --description "Get the version of an npm package in the current directory"
  node -p "r=require('./node_modules/$argv[1]/package.json'); r.version || r.version" 2>/dev/null
end
