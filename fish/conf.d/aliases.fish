alias ...="cd ../../"
alias ....="cd ../../../"

# Services
alias dolar="http -p 'b' :8880/api/trpc/finance.getDollar | jq .result.data"
alias dollar="http -p 'b' :8880/api/trpc/finance.getDollar | jq .result.data"
