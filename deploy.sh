#!/usr/bin/env sh

# if error throwing, stop the script running
set -e

# packaging
npm run build

# move to dist directory after packaging
cd dist
git init  # because default is ignore
git add -A
git commit -m 'deploy'

# deploy to my github gh-pages branch
git push -f https://github.com/KaiChihCodeme/kai_portfolio.git master:gh-pages

cd -