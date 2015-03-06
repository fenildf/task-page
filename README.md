# README

## 开发环境搭建
```
git clone git@github.com:mindpin/task-page.git
cd task-page
cp config/mongoid.yml.example config/mongoid.yml
# 复制 r.rb 并根据需要修改
cp config/initializers/r.rb.example config/initializers/r.rb

bundle
rails s
```

## 登陆说明
config/initializers/r.rb 文件中记录的是登陆用户和密码