1.  http://rogerdudler.github.io/git-guide/index.zh.html

2.  https://www.atlassian.com/git/

3.  https://help.github.com/articles/generating-ssh-keys.

4.  https://bitnami.com/stack/gitlab

5.  https://git.wiki.kernel.org/index.php/GitHosting


0.  2005

1.  cvs & lcvs & ccvs & dcvs

2.  git & svn

3.  working directory staging area .Git directory;  branch, hash, HEAD, HEAD~, HEAD~2

4.  git-repo

5.  git init/clone

6.  git status/add/rm/mv/commit ; git commit --amend

7.  git branch

8.  git reset

9.  git revert

10. git checkout ; git checkout -b 

11. git rebase

12. git log --pretty=oneline; git log --pretty=format:"%h %s" --graph

13. git merge

14. git pull/push

15. git stash

16. git config --global;  ~/.gitconfig

17. git diff

18. git cherry-pick


1.  Git的来源
2.  Git的原理和命令
3.  Git与内源开发模式
4.  GitLab在项目协作开发中的最佳实践


19. git fetch

20. git remote add/rm/show/rename; git remote -v

21. .gitignore

22. git tag

23. gitlab codereview/settings/member role/issues/contributions/wiki

24. markdown

25. git submodule

统计某人的代码提交量，包括增加，删除：
git log --since=2017-01-01 --until=2017-06-30 --pretty=tformat: --numstat | gawk '{ add += $1 ; subs += $2 ; loc += $1 - $2 } END { printf "added lines: %s removed lines : %s total lines: %s\n",add,subs,loc }' -
仓库提交者排名前 5（如果看全部，去掉 head 管道即可）：
git log --pretty='%aN' | sort | uniq -c | sort -k1 -n -r | head -n 5
仓库提交者（邮箱）排名前 5：这个统计可能不会太准，因为很多人有不同的邮箱，但会使用相同的名字
git log --pretty=format:%ae | gawk -- '{ ++c[$0]; } END { for(cc in c) printf "%5d %s\n",c[cc],cc; }' | sort -u -n -r | head -n 5 
贡献者统计：
git log --pretty='%aN' | sort -u | wc -l
提交数统计：
git log --oneline | wc -l 
添加或修改的代码行数：
git log --stat|perl -ne 'END { print $c } $c += $1 if /(\d+) insertions/;
