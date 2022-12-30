#!/bin/bash
read -p 'Enter blog prompt:' BLOG_PROMPT
cd /tmp
export GIT_SSH_CMD='ssh -i ${GIT_KEY_PATH}'
echo ${CR_PAT} | docker login ghcr.io --username hashtagcyber --password-stdin
git clone git@github.com:hashtagcyber/myai.blog.git myai.temp
cd myai.temp/app/_posts
git checkout newcontent
export CURRENT_DIR=`pwd`
docker run --rm -it -v ${CURRENT_DIR}:/app/output -e OPENAI_API_KEY=${OPENAI_API_KEY} ghcr.io/hashtagcyber/bloggy:latest -w -t "${BLOG_PROMPT}"
cd ../../
export BUILD_ENV=k8s
source build-and-push.sh
git add .
git commit -m "Updated content"
git push
cd ../
rm -rf myai.temp