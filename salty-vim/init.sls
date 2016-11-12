git:
  pkg.installed

https://github.com/saltstack/salt-vim.git:
  git.latest:
    - target: /root/.vim/
    - require:
      - pkg: git

/root/.vimrc:
  - source: salt://salty-vim/files/.vim.rc
  - user: root
  - group: root
  - mode: 750