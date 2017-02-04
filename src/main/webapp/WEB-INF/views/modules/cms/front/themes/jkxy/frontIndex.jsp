<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>首页</title>
<meta name="decorator" content="cms_default_${site.theme}" />
<meta name="description" content="JeeSite ${site.description}" />
<meta name="keywords" content="JeeSite ${site.keywords}" />
<link rel="stylesheet" href="${ctxStaticTheme }/css/swiper.css">
</head>
<body>
	<div id="pager">
		<div class="w-1000 mar-t20 cf">
			<section class="jk-banner">
				<div class="banner-container" style="cursor: -webkit-grab;">
					<!-- Add Pagination -->
			        <div class="swiper-pagination"></div>
			        <!-- Add Arrows -->
			        <div class="swiper-button-next"></div>
			        <div class="swiper-button-prev"></div>
			        <div class="swiper-wrapper">
			        	<a href="http://j.jikexueyuan.com/train/ux?jike_campaign=online&amp;jike_location=www_index_cf&amp;jike_content=161130" target="_blank" value="线上就业班UX上线" class="swiper-slide" style=" background: url(http://a1.jikexueyuan.com/home/201611/28/153f/583bc9ed15786.jpg) center center no-repeat rgb(245, 245, 245);"></a>
			            <a href="http://j.jikexueyuan.com/train/web-offline?utm_source=jike&amp;utm_medium=www_index_a_cf&amp;utm_campaign=jiuye_yingxiao_chen&amp;utm_content=v20160913" target="_blank" value="web大前端线下培训班" class="swiper-slide" style=" background: url(http://a1.jikexueyuan.com/home/201609/26/2027/57e8bdeeea6b8.jpg) center center no-repeat rgb(245, 245, 245);"></a>
	                    <a href="http://j.jikexueyuan.com/train/php?jike_campaign=ganenjie&amp;jike_location=www_index_cf&amp;jike_content=161130" target="_blank" value="php线上就业班" class="swiper-slide" style=" background: url(http://a1.jikexueyuan.com/home/201611/24/1d6b/5836e7ecd1e2d.jpg) center center no-repeat rgb(245, 245, 245);"></a>
	                    <a href="https://www.qcloud.com/training/courses/video-dev?utm_source=sylunbo&amp;utm_medium=1216course&amp;utm_campaign=jikexueyuan " target="_blank" value="腾讯云0到1打造直播平台" class="swiper-slide" style=" background: url(http://a1.jikexueyuan.com/home/201611/29/50de/583d50a6c9571.jpg) center center no-repeat rgb(245, 245, 245);"></a>
			        </div>
			    </div>
			</section>
			<section class="jk-login">

				<div class="userInfo">
					<a href="http://my.jikexueyuan.com/setting/user"> <img
						src="${ctxStaticTheme }/images/headpic_8ce0f6d.jpg" class="userImg">
					</a> <span class="userName">Hello,</span>
					<p class="userStatus">欢迎成为极客一员</p>
				</div>
				<a href="#" class="loginOn diaLoginBtn">登录</a> <a
					href="http://passport.jikexueyuan.com/sso/reg_phone"
					class="registerNow">免费注册</a>

			</section>
			<section class="jk-huodong" id="banner02-1"></section>
			<section class="jk-jiuye">
				<a
					href="http://j.jikexueyuan.com/train/php?jike_campaign=jiuyeban&jike_location=www_index_jiuye_imagelink_1&jike_content=161130"
					class="jk-ban php" target="_blank"> <img
					src="${ctxStaticTheme }/images/9_php_d5fcdb8.png">
					<p>PHP工程师就业班</p>
				</a> <a
					href="http://j.jikexueyuan.com/train/web?jike_campaign=jiuyeban&jike_location=www_index_jiuye_imagelink_2&jike_content=161130"
					class="jk-ban web" target="_blank"> <img
					src="${ctxStaticTheme }/images/4_html5_9ab5f1c.png">
					<p>WEB大前端工程师就业班</p>
				</a> <a
					href="http://j.jikexueyuan.com/train/ux?jike_campaign=jiuyeban&jike_location=www_index_jiuye_imagelink_3&jike_content=161130"
					class="jk-ban ui" target="_blank"> <img
					src="${ctxStaticTheme }/images/UI_a5eba34.png">
					<p>UI/UE设计师就业班</p>
				</a> <a
					href="http://j.jikexueyuan.com/train/android?jike_campaign=jiuyeban&jike_location=www_index_jiuye_imagelink_4&jike_content=161130"
					class="jk-ban android" target="_blank"> <img
					src="${ctxStaticTheme }/images/1_android_d6730f3.png">
					<p>Android工程师就业班</p>
				</a> <a
					href="http://j.jikexueyuan.com/train/ios?jike_campaign=jiuyeban&jike_location=www_index_jiuye_imagelink_5&jike_content=161130"
					class="jk-ban ios" target="_blank"> <img
					src="${ctxStaticTheme }/images/2_iOS_5e77ff4.png">
					<p>iOS工程师就业班</p>
				</a> <a
					href="http://j.jikexueyuan.com/train/javaweb?jike_campaign=jiuyeban&jike_location=www_index_jiuye_imagelink_6&jike_content=161130"
					class="jk-ban javaweb" target="_blank"> <img
					src="${ctxStaticTheme }/images/10_javaweb_26f34e5.png">
					<p>Java Web工程师就业班</p>
				</a>
			</section>
		</div>
		<section class="jk-sku">
			<ul>

				<li><a href="/zhiye/course/34.html?type=8" target="_blank">
						<img src="${ctxStaticTheme }/images/2a7bf0a0-d94d-40d4-a244-20e5a5e359e6.jpg">
						<div class="skuContainer">
							<p class="skuTitle">『微信小程序』从基础到实战</p>
							<p class="skuInfo">14小时&nbsp;&nbsp;|&nbsp;&nbsp;1门课</p>
							<span class="skuPrice">449.00</span> <span class="skuThrought">¥499.00</span>
							<span class="skuNum">1914人学习</span>
						</div>
				</a></li>

				<li><a href="/zhiye/course/37.html?type=4" target="_blank">
						<img src="${ctxStaticTheme }/images/7a70c982-28a4-4340-8044-b3434df19713.jpg">
						<div class="skuContainer">
							<p class="skuTitle">Python利器，超凡蜘蛛带你“爬”世界</p>
							<p class="skuInfo">37小时&nbsp;&nbsp;|&nbsp;&nbsp;1门课</p>
							<span class="skuPrice">349.00</span> <span class="skuThrought">¥499.00</span>
							<span class="skuNum">98人学习</span>
						</div>
				</a></li>

				<li><a href="/zhiye/course/24.html?type=10" target="_blank">
						<img src="${ctxStaticTheme }/images/0fc0e89e-e83c-4a6e-8229-ff8c57ea5d9e.jpg">
						<div class="skuContainer">
							<p class="skuTitle">0基础学iOS——Swift基础</p>
							<p class="skuInfo">16小时&nbsp;&nbsp;|&nbsp;&nbsp;1门课</p>
							<span class="skuPrice">99.00</span> <span class="skuThrought">¥159.00</span>
							<span class="skuNum">79人学习</span>
						</div>
				</a></li>

				<li><a href="/zhiye/course/39.html?type=8" target="_blank">
						<img src="${ctxStaticTheme }/images/4a1029ca-89bc-472c-8bd1-68f97034c5fd.jpg">
						<div class="skuContainer">
							<p class="skuTitle">7小时玩转网页布局开发</p>
							<p class="skuInfo">8小时&nbsp;&nbsp;|&nbsp;&nbsp;1门课</p>
							<span class="skuPrice">59.00</span> <span class="skuThrought">¥129.00</span>
							<span class="skuNum">12人学习</span>
						</div>
				</a></li>

			</ul>
		</section>
		<section class="jk-college">
			<h2>职业学院</h2>
			<ul>
				<li class="web"><a href="/zhiye/web"> <img src="${ctxStaticTheme }/images/bgweb_054d9d5.jpg"> <i></i> <span>Web 前端工程师</span></a></li>
				<li class="python"><a href="/zhiye/python"> <img src="${ctxStaticTheme }/images/bgpython_c21a999.jpg"> <i></i> <span>Python Web 工程师</span></a></li>
				<li class="go"><a href="/zhiye/go"> <img src="${ctxStaticTheme }/images/bggo_6ac4e5b.jpg"> <i></i> <span>GO 语言工程师</span></a></li>
				<li class="ios"><a href="/zhiye/ios"> <img src="${ctxStaticTheme }/images/bgios_cadb5b0.jpg"> <i></i> <span>iOS 工程师</span></a></li>
				<li class="more"><a href="javascript:;"> <img src="${ctxStaticTheme }/images/bgmore_b32bab9.jpg"> <span>更多职业 敬请期待</span></a></li>
			</ul>
		</section>
		<section class="jk-vip">
			<h2>会员课程</h2>
			<ul>
				<li><a href="/path/android"> <img src="${ctxStaticTheme }/images/1_android_d6730f3.png"><p>Android</p> <span>90门课程</span></a></li>
				<li><a href="/path/ios"> <img src="${ctxStaticTheme }/images/2_iOS_5e77ff4.png"><p>iOS</p> <span>51门课程</span></a></li>
				<li><a href="/path/swift"> <img src="${ctxStaticTheme }/images/3_swift_79f5d60.png"><p>Swift语言</p> <span>11门课程</span></a></li>
				<li><a href="/path/html5"> <img src="${ctxStaticTheme }/images/4_html5_9ab5f1c.png"><p>HTML5开发</p> <span>116门课程</span></a></li>
				<li><a href="/path/javascript"> <img src="${ctxStaticTheme }/images/5_javascript_83e4b7f.png"><p>JavaScript</p> <span>90门课程</span></a></li>
				<li><a href="/path/nodejs"> <img src="${ctxStaticTheme }/images/6_js_c56bccc.png"><p>Node.js</p> <span>90门课程</span></a></li>
				<li><a href="/path/c"> <img src="${ctxStaticTheme }/images/7_c_07f10c0.png"><p>C语言</p> <span>17门课程</span></a></li>
				<li><a href="/path/java"> <img src="${ctxStaticTheme }/images/8_java_89b7c2c.png"><p>Java语言</p> <span>17门课程</span></a></li>
				<li><a href="/path/php"> <img src="${ctxStaticTheme }/images/9_php_d5fcdb8.png"><p>PHP语言</p> <span>23门课程</span></a></li>
				<li><a href="/path/javaweb"> <img src="${ctxStaticTheme }/images/10_javaweb_26f34e5.png"><p>JavaWeb</p> <span>64门课程</span></a></li>
				<li><a href="/path/python"> <img src="${ctxStaticTheme }/images/11_Python_d253c3e.png"><p>Python</p> <span>38门课程</span></a></li>
				<li><a href="/path/cocos2d-x"> <img src="${ctxStaticTheme }/images/12_cocos2d_037cd04.png"><p>Cocos2d-x游戏开发</p> <span>89门课程</span></a></li>
			</ul>
			<a class="vipAll" href="/course/">全部会员课程</a>
		</section>
		<section class="jk-story">
			<h2>学员故事</h2>
			<div class="story-container" style="cursor: -webkit-grab;">
				<div class="swiper-wrapper">
					<div class="swiper-slide" style="background: #ccc">
						<ul>
							<li><a href="http://blog.jikexueyuan.com/2.html"
								target="_blank">
									<div class="story-content">
										<p>从房地产营销策划转行前端工程师。努力并不是为了证明自己多厉害，只是对自己生活方式的一种选择，每个人都可以通过自己的努力，去决定自己生活的样子。</p>
									</div>
									<div class="story-info">
										<img src="${ctxStaticTheme }/images/student-1-avatar.jpg">
										<p>朱华宇</p>
										<span>入职 极客学院</span>
									</div>
							</a></li>
							<li><a href="http://blog.jikexueyuan.com/3.html"
								target="_blank">
									<div class="story-content">
										<p>从浑浑噩噩的自动化专业学生，到大三暑假进入研究院实习。当时努力克服的那些困难，都成了现在自己的资本和财富。</p>
									</div>
									<div class="story-info">
										<img src="${ctxStaticTheme }/images/student-2-avatar.jpg">
										<p>黄文俊</p>
										<span>入职 深圳北斗技术应用研究院</span>
									</div>
							</a></li>
							<li><a href="http://blog.jikexueyuan.com/4.html"
								target="_blank">
									<div class="story-content">
										<p>电力工程设计转前端，很感谢极客学院给了我理想的转行准备。以高密度锻炼的方式，逼迫自己尽快熟悉团队开发模式，顺利进入程序员的世界，接触到的新技术拓宽了我的眼界。</p>
									</div>
									<div class="story-info">
										<img src="${ctxStaticTheme }/images/student-3-avatar.jpg">
										<p>王浩博</p>
										<span>入职 北京中科软科技股份有限公司</span>
									</div>
							</a></li>
						</ul>
					</div>
					<div class="swiper-slide">
						<ul>
							<li><a href="http://blog.jikexueyuan.com/5.html"
								target="_blank">
									<div class="story-content">
										<p>爆炸力学硕士转安卓开发，回顾自己从爆炸力学走向代码世界的历程，感触良多。庆幸自己没有留在研究所，程序员不断学习不断进步的感觉更有意义。稳定绝不代表停滞，历练才是我们的财富。</p>
									</div>
									<div class="story-info">
										<img src="${ctxStaticTheme }/images/student-4-avatar.jpg">
										<p>张少龙</p>
										<span>入职 北京中航智科技</span>
									</div>
							</a></li>
							<li><a href="http://blog.jikexueyuan.com/6.html"
								target="_blank">
									<div class="story-content">
										<p>美女程序媛，从运维转岗到前端开发工程师。工作上的变化只是一部分，遇到极客学院更重要的是让我知道了自己的潜力，不被未来的不确定性吓倒，相信有目标，肯努力就可以得到想要的生活。</p>
									</div>
									<div class="story-info">
										<img src="${ctxStaticTheme }/images/student-5-avatar.jpg">
										<p>杨帆</p>
										<span>入职 深圳IBM</span>
									</div>
							</a></li>
							<li><a href="http://blog.jikexueyuan.com/7.html"
								target="_blank">
									<div class="story-content">
										<p>Web大前端工程师就业班五期 03 班学员，某 985 大学信息与计算科学 2016 届毕业生，2 个月完成
											16 个任务，被同班同学称为「大神」。2016 年拿到毕业证书的同时也拿到了 15K 高薪的 offer。</p>
									</div>
									<div class="story-info">
										<img src="${ctxStaticTheme }/images/student-6-avatar.jpg">
										<p>路昕宇</p>
										<span>入职 浪弯融科科技公司</span>
									</div>
							</a></li>
						</ul>
					</div>
				</div>
				<div class="story-pagination"></div>
			</div>
		</section>
		<section class="jk-partner">
			<h2>合作企业</h2>
			<ul>
				<li><a target="_blank" href="/partner/#microsoft"></a></li>
				<li><a target="_blank" href="/partner/#tencent"></a></li>
				<li><a target="_blank" href="http://zt.jikexueyuan.com/qcloud"></a></li>
				<li><a target="_blank"
					href="http://zt.jikexueyuan.com/qualcomm"></a></li>
				<li><a target="_blank" href="/partner/#cocos"></a></li>
				<li><a target="_blank" href="/partner/#amd"></a></li>
				<li><a target="_blank" href="/partner/#xunfei"></a></li>
				<li><a target="_blank" href="/partner/#tuling"></a></li>
				<li><a target="_blank" href="/partner/#tingyun"></a></li>
				<li><a target="_blank" href="/partner/#juhe"></a></li>
				<li><a target="_blank" href="/partner/#bootstrap"></a></li>
				<li><a target="_blank" href="/partner/#cloudstack"></a></li>
			</ul>
			<a class="more-partner" target="_blank" href="/partner">更多合作企业</a>
		</section>
	</div>
	<!-- Swiper JS -->
    <script src="${ctxStaticTheme }/js/swiper.js"></script>

    <!-- Initialize Swiper -->
    <script>
    var swiper = new Swiper('.banner-container', {
    	pagination: '.swiper-pagination',
        nextButton: '.swiper-button-next',
        prevButton: '.swiper-button-prev',
        paginationClickable: true,
        spaceBetween: 30,
        centeredSlides: true,
        autoplay: 2500,
        autoplayDisableOnInteraction: false
    });
    </script>
</body>
</html>