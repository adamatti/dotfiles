function take --description 'Create a directory and set it as the current working directory'
    mkdir -p $argv && cd $argv[-1]
end
