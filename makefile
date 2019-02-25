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
	-git rm -r azure-pipelines.yml charts Dockerfile draft.toml .dockerignore .draft-tasks.toml .draftignore
	-git commit -m "reset demo"
	-git push

helm-delete:
	-helm delete --purge jfrog

azd-clean:
	@scripts/azdo-cleanup.sh
