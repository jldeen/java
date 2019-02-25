BRANCH ?= master
SUBSCRIPTION ?= "jessde"
RG ?= jdk8s-us

.PHONY: delete-deploymentSlot git-clean azd-clean

all:
	-make git-clean
	-make helm-delete
	make azd-clean 

# delete-branch: 
# 	-git branch -d $(BRANCH)
# 	-git push origin -d $(BRANCH) && echo "$(branch) branch successfully deleted"
# 	-git fetch --prune

git-clean:
	-rm -rf charts
	-git rm -rf azure-pipelines.yml Dockerfile draft.toml .dockerignore .draft-tasks.toml .draftignore charts
	-git commit -m "reset demo"
	-git push

helm-delete:
	-helm delete --purge jfrog
	-helm delete --purge jfrog-prod

azd-clean:
	@scripts/azdo-cleanup.sh
