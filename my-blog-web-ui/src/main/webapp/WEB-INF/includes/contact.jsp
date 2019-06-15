<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 2019/5/18
  Time: 23:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<section id="contact" onclick="alert('功能正在快马加鞭制作中')">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="col-lg-12">
                    <div class="text-center color-elements">
                        <h2>联系 我们</h2>
                    </div>
                </div>
                <div class="col-lg-6 col-md-8">
                    <form class="inline" id="contactForm" method="post" >
                        <div class="row">
                            <div class="col-sm-6 height-contact-element">
                                <div class="form-group">
                                    <input type="text" name="first_name" class="form-control custom-labels" id="name" placeholder="FULL NAME" required data-validation-required-message="Please write your name!"/>
                                    <p class="help-block text-danger"></p>
                                </div>
                            </div>
                            <div class="col-sm-6 height-contact-element">
                                <div class="form-group">
                                    <input type="email" name="email" class="form-control custom-labels" id="email" placeholder="EMAIL" required data-validation-required-message="Please write your email!"/>
                                    <p class="help-block text-danger"></p>
                                </div>
                            </div>
                            <div class="col-sm-12 height-contact-element">
                                <div class="form-group">
                                    <input type="text" name="message" class="form-control custom-labels" id="message" placeholder="WHAT'S ON YOUR MIND" required data-validation-required-message="Please write a message!"/>
                                </div>
                            </div>
                            <div class="col-sm-3 col-xs-6 height-contact-element">
                                <div class="form-group">
                                    <input type="submit" class="btn btn-md btn-custom btn-noborder-radius" value="发送"/>
                                </div>
                            </div>
                            <div class="col-sm-3 col-xs-6 height-contact-element">
                                <div class="form-group">
                                    <button type="button" class="btn btn-md btn-noborder-radius btn-custom" name="reset">重置
                                    </button>
                                </div>
                            </div>
                            <div class="col-sm-3 col-xs-6 height-contact-element">
                                <div class="form-group">
                                    <div id="response_holder"></div>
                                </div>
                            </div>
                            <div class="col-sm-12 contact-msg">
                                <div id="success"></div>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="col-lg-5 col-md-3 col-lg-offset-1 col-md-offset-1">
                    <div class="row">
                        <div class="col-md-12 height-contact-element">
                            <div class="form-group">
                                <i class="fa fa-2x fa-map-marker"></i>
                                <span class="text">江西财经大学</span>
                            </div>
                        </div>
                        <div class="col-md-12 height-contact-element">
                            <div class="form-group">
                                <i class="fa fa-2x fa-phone"></i>
                                <span class="text">150****7468</span>
                            </div>
                        </div>
                        <div class="col-md-12 height-contact-element">
                            <div class="form-group">
                                <i class="fa fa-2x fa-envelope"></i>
                                <span class="text">1440629746@qq.com</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
