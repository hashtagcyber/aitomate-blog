Note: Does not currently work as dockerfile. run the script, get prompted, it does the work.

1. accept input
2. git clone myai.blog
3. cd into ./app/_posts
4. run openai-bloggy using input
5. cd top of repo
6. . build-and-push
7. git commit -a -m ‘added content’
8. git push

## Container Needs:
Environs:
- CR_PAT : Github token for docker exec/push
- GIT_KEY_PATH: Path to github ssh key for git clone
- OPENAI_API_KEY : API key for OpenAI
File Secrets:
- GIT_SSH_KEY

Mounts:
- Docker SOCK