function dc --argument-names cmd --argument-names svc --description "Shortcuts for docker-compose"
  switch $cmd;
    case pull;
      # echo "Pulling $svc..."
      docker-compose pull $svc
      return
    case up;
      # echo "Starting $svc..."
      docker-compose up -d $svc
      return
    case down;
      # echo "Stopping $svc..."
      docker-compose rm -sv $svc
      return
    case update;
      # echo "Updating $svc..."
      dc pull $svc
      dc down $svc
      dc up $svc
      return
    case clean;
      echo "Cleaning $svc..."
      switch $svc;
        case 'all';
          docker system prune --all --volumes
          return
        case 'system';
          docker system prune
          return
        case 'images';
          docker image prune
          return
        case 'network'
          docker network prune
          return
      end
    case "";
      echo "No command provided, must be one of: pull, up, down, update"
    case "*";
      echo "'$cmd' is not a recognized command"
      return
  end
end
