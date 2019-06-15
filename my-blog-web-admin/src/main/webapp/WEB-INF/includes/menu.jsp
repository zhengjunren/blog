<%@ page import="xyz.zzz989.my.blog.domain.entity.Blogger" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
        <!-- Sidebar user panel -->
        <div class="user-panel">
            <div class="pull-left image">
                <img src="/static/assets/images/user2-160x160.jpg" class="img-circle" alt="User Image">
            </div>
            <div class="pull-left info">
                <p>${blogger.email}</p>
                <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
            </div>
        </div>
        <!-- sidebar menu: : style can be found in sidebar.less -->
        <ul class="sidebar-menu" data-widget="tree">
            <li class="header">功能菜单</li>

                <li class="active treeview">
                    <a href="#">
                        <i class="fa fa-users"></i> <span>用户管理</span>
                        <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
                    </a>
                    <ul class="treeview-menu">
                        <li><a href="/blogger/list"><i class="fa fa-circle-o"></i> 用户列表</a></li>
                        <li><a href="/blogger/form"><i class="fa fa-circle-o"></i> 新增用户</a></li>
                    </ul>
                </li>

            <li class="active treeview">
                <a href="#">
                    <i class="fa fa-comment"></i> <span>博客管理</span>
                    <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
                </a>
                <ul class="treeview-menu">
                    <li><a href="/blog/list"><i class="fa fa-circle-o"></i> 博客列表</a></li>
                    <li><a href="/blog/form1"><i class="fa fa-circle-o"></i> 发布博客</a></li>
                </ul>
            </li>
            <li class="active treeview">
                <a href="#">
                    <i class="fa fa-book"></i> <span>内容管理</span>
                    <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
                </a>
                <ul class="treeview-menu">
                    <li><a href="/blog/category/list"><i class="fa fa-circle-o"></i> 内容分类</a></li>
                        <li><a type="button" onclick="App.showAddCategory('/blog/category/form')"><i class="fa fa-circle-o"></i> 新建分类</a></li>
                </ul>
            </li>
            <li class="active treeview" onclick="alert('功能正在快马加鞭制作中！')">
                <a href="#">
                    <i class="fa fa-commenting"></i> <span>评论管理</span>
                    <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
                </a>
                <ul class="treeview-menu">
                    <li><a href="#"><i class="fa fa-circle-o"></i> 评论列表</a></li>
<%--                    <li><a type="button" ><i class="fa fa-circle-o"></i> 新建分类</a></li>--%>
                </ul>
            </li>
        </ul>
    </section>
</aside>