# https://fishshell.com/docs/current/cmds/abbr.html
abbr -a --position anywhere -- -C --color
# abbr -a --position anywhere -- -W --watch
# abbr -a --position anywhere -- -H --help

abbr bi brew install
abbr bs brew search
abbr cat bat
abbr cls clear
abbr e exit
abbr h http
abbr k kubectl
abbr m make
abbr md mkdir -p
abbr mm make -f Makefile.adamatti
abbr mt mise trust
abbr t task
abbr tf tofu
abbr tgu task -g u
abbr wt wezterm cli set-tab-title
abbr c cursor
abbr a agy

# Docker
abbr d docker
abbr dc docker compose
abbr dcl docker compose ls
abbr dops 'docker ps --format "table {{.Names}}\t{{.ID}}\t{{.Image}}\t{{.CreatedAt}}\t{{.Status}}" | sort'

# Node
abbr biome pnpm dlx @biomejs/biome
abbr hs npx http-server
abbr p pnpm
abbr px pnpm dlx

# Git - https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/git/README.md
abbr g git
abbr ga git add
abbr gcb git checkout -b
abbr gcmsg git commit --message
abbr gco git checkout
abbr gl git pull
abbr glol "git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset'"
abbr glog git log --oneline --decorate --graph
abbr gp git push
abbr gpra git pull --rebase --autostash
abbr gss git status --short
abbr gignore git update-index --assume-unchanged
abbr gunignore git update-index --no-assume-unchanged
abbr gignored "git ls-files -v | grep \"^[[:lower:]]\""
abbr grv git remote --verbose
abbr gs git switch

# Pet
abbr pec "pet search --color | pbcopy"
abbr pel pet list
abbr pen pet new -t
abbr pes pet search --color
abbr pex pet exec --color
