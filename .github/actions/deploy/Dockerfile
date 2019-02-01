FROM p1hub/kubernetes-helm:latest

LABEL "com.github.actions.name"="kubectl dryrun"
## The description for the action
LABEL "com.github.actions.description"="teeeest"
## https://developer.github.com/actions/creating-github-actions/creating-a-docker-container/#supported-feather-icons
LABEL "com.github.actions.icon"="check"
## The color of the action icon
LABEL "com.github.actions.color"="blue"

COPY deploy.sh /usr/bin/deploy.sh
RUN chmod +x  /usr/bin/deploy.sh

CMD ["deploy.sh"]
