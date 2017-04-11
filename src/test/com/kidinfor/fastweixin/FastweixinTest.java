package com.kidinfor.fastweixin;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.http.client.utils.DateUtils;
import org.junit.Assert;
import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.kidinfor.fastweixin.api.CustomAPI;
import com.kidinfor.fastweixin.api.DataCubeAPI;
import com.kidinfor.fastweixin.api.JsAPI;
import com.kidinfor.fastweixin.api.MaterialAPI;
import com.kidinfor.fastweixin.api.MediaAPI;
import com.kidinfor.fastweixin.api.MenuAPI;
import com.kidinfor.fastweixin.api.MessageAPI;
import com.kidinfor.fastweixin.api.OauthAPI;
import com.kidinfor.fastweixin.api.SystemAPI;
import com.kidinfor.fastweixin.api.UserAPI;
import com.kidinfor.fastweixin.api.config.ApiConfig;
import com.kidinfor.fastweixin.api.entity.Article;
import com.kidinfor.fastweixin.api.entity.CustomAccount;
import com.kidinfor.fastweixin.api.entity.Group;
import com.kidinfor.fastweixin.api.entity.Menu;
import com.kidinfor.fastweixin.api.entity.MenuButton;
import com.kidinfor.fastweixin.api.enums.MaterialType;
import com.kidinfor.fastweixin.api.enums.MediaType;
import com.kidinfor.fastweixin.api.enums.MenuType;
import com.kidinfor.fastweixin.api.enums.OauthScope;
import com.kidinfor.fastweixin.api.enums.ResultType;
import com.kidinfor.fastweixin.api.response.DownloadMaterialResponse;
import com.kidinfor.fastweixin.api.response.DownloadMediaResponse;
import com.kidinfor.fastweixin.api.response.GetArticleSummaryResponse;
import com.kidinfor.fastweixin.api.response.GetArticleTotalResponse;
import com.kidinfor.fastweixin.api.response.GetGroupsResponse;
import com.kidinfor.fastweixin.api.response.GetMaterialListResponse;
import com.kidinfor.fastweixin.api.response.GetMaterialTotalCountResponse;
import com.kidinfor.fastweixin.api.response.GetMenuResponse;
import com.kidinfor.fastweixin.api.response.GetSendMessageResponse;
import com.kidinfor.fastweixin.api.response.GetSignatureResponse;
import com.kidinfor.fastweixin.api.response.GetUserCumulateResponse;
import com.kidinfor.fastweixin.api.response.GetUserInfoResponse;
import com.kidinfor.fastweixin.api.response.GetUserReadHourResponse;
import com.kidinfor.fastweixin.api.response.GetUserReadResponse;
import com.kidinfor.fastweixin.api.response.GetUserShareHourResponse;
import com.kidinfor.fastweixin.api.response.GetUserShareResponse;
import com.kidinfor.fastweixin.api.response.GetUserSummaryResponse;
import com.kidinfor.fastweixin.api.response.GetUsersResponse;
import com.kidinfor.fastweixin.api.response.OauthGetTokenResponse;
import com.kidinfor.fastweixin.api.response.UploadMaterialResponse;
import com.kidinfor.fastweixin.api.response.UploadMediaResponse;
import com.kidinfor.fastweixin.message.MpNewsMsg;
import com.kidinfor.fastweixin.util.StrUtil;

/**
 * @author peiyu
 */
public class FastweixinTest {

    private static final Logger LOG = LoggerFactory.getLogger(FastweixinTest.class);

    private ApiConfig config;

//    @Before
    public void init() {
//        String appid = "wx8c33ff895df5d0d9";
//        String secret = "0705aafac0bef944de4c485d71fce900";
        String appid = "wx337021cfcc3e32fb";
        String secret = "e244f1244f0ba2798546e0450d3045ea";
        config = new ApiConfig(appid, secret);
        TestConfigChangeHandle configChangeHandle = new TestConfigChangeHandle();
        config.addHandle(configChangeHandle);
    }

    /*
     *AppID(应用ID)wx8c33ff895df5d0d9
     *AppSecret(应用密钥)0705aafac0bef944de4c485d71fce900
     */
    @Test
    public void test() {
        String appid = "wxdd7dda6d8a13b2a0";//"wx8c33ff895df5d0d9";
        String secret = "10daec969800177c94a81d378faa7242";//"0705aafac0bef944de4c485d71fce900";
        ApiConfig config = new ApiConfig(appid, secret);
        TestConfigChangeHandle configChangeHandle = new TestConfigChangeHandle();
        config.addHandle(configChangeHandle);
        createMenu(config);
        //getUserList(config);
//        uploadMedia(config);
//        downloadMedia(config);
//        getUserInfo(config);
//        getMenu(config);
//        addCustomAccount(config);
//          getOauthPageUrl(config);
//          getToken(config);
//          oauthGetUserInfo(config);
        //ApiConfig config = new ApiConfig(appid, secret, true);
        //testGetJsApiTicket(config);
        //testJsApiSign(config);
        //getUserData(config);
//        getArticleData(config);
//        sendAllMessage(config);
        //getUserGroups(config);
//        updateGroup(config);
//        getCallbackIP(config);
//        getShortUrl(config);
//        uploadImageMaterial(config);
    }


    /**
     * 创建菜单
     *
     * @param config API配置
     */
    private void createMenu(ApiConfig config) {
        MenuAPI menuAPI = new MenuAPI(config);

        //先删除之前的菜单
        menuAPI.deleteMenu();
        Menu request = new Menu();
        //准备一级主菜单
        MenuButton main1 = new MenuButton();
        main1.setType(MenuType.CLICK);
        main1.setKey("main1");
        main1.setName("天羽联");
        main1.setType(MenuType.VIEW);
        main1.setUrl("https://open.weixin.qq.com/connect/oauth2/authorize?appid=wxdd7dda6d8a13b2a0&redirect_uri=http://www.sportslm.com/f&response_type=code&scope=snsapi_userinfo&state=123#wechat_redirect");
        
        //准备子菜单
        MenuButton sub1 = new MenuButton();
        sub1.setKey("sub1");
        sub1.setName("授权2");
        sub1.setType(MenuType.VIEW);
        sub1.setUrl("https://open.weixin.qq.com/connect/oauth2/authorize?appid=wxdd7dda6d8a13b2a0&redirect_uri=http://bisai.tunnel.qydev.com/f&response_type=code&scope=snsapi_userinfo&state=123#wechat_redirect");
        MenuButton sub2 = new MenuButton();
        sub2.setKey("sub2");
        sub2.setName("点击2");
        sub2.setType(MenuType.CLICK);


        List<MenuButton> list = new ArrayList<MenuButton>();
        list.add(sub1);
        list.add(sub2);
        //将子菜单放入主菜单里
        //main1.setSubButton(list);

        MenuButton main2 = new MenuButton();
        main2.setKey("main2");
        main2.setName("天羽盟");
        main2.setType(MenuType.CLICK);

        MenuButton sub3 = new MenuButton();
        sub3.setKey("sub3");
        sub3.setName("友场馆");
        sub3.setType(MenuType.VIEW);
        sub3.setUrl("https://open.weixin.qq.com/connect/oauth2/authorize?appid=wxdd7dda6d8a13b2a0&redirect_uri=http://www.sprotslm.com/info/info/area.action&response_type=code&scope=snsapi_userinfo&state=123#wechat_redirect");

        MenuButton sub4 = new MenuButton();
        sub4.setKey("sub4");
        sub4.setName("友赞助");
        sub4.setType(MenuType.VIEW);
        sub4.setUrl("https://open.weixin.qq.com/connect/oauth2/authorize?appid=wxdd7dda6d8a13b2a0&redirect_uri=http://www.sprotslm.com/info/info/aword.action&response_type=code&scope=snsapi_userinfo&state=123#wechat_redirect");

        MenuButton sub5 = new MenuButton();
        sub5.setKey("sub5");
        sub5.setName("友教练");
        sub5.setType(MenuType.VIEW);
        sub5.setUrl("https://open.weixin.qq.com/connect/oauth2/authorize?appid=wxdd7dda6d8a13b2a0&redirect_uri=http://www.sprotslm.com/info/info/tech.action&response_type=code&scope=snsapi_userinfo&state=123#wechat_redirect");

        List<MenuButton> list2 = new ArrayList<MenuButton>();
        list2.add(sub3);
        list2.add(sub4);
        list2.add(sub5);
        //将子菜单放入主菜单里
        main2.setSubButton(list2);

        MenuButton main3 = new MenuButton();
        main3.setKey("main3");
        main3.setName("联系我们");
        main3.setType(MenuType.CLICK);

        MenuButton sub6 = new MenuButton();
        sub6.setKey("sub6");
        sub6.setName("场馆加盟");
        sub6.setType(MenuType.VIEW);
        sub6.setUrl("https://open.weixin.qq.com/connect/oauth2/authorize?appid=wxdd7dda6d8a13b2a0&redirect_uri=http://www.sprotslm.com/info/message/toSaveMessage.action?message.type=1&response_type=code&scope=snsapi_userinfo&state=123#wechat_redirect");

        MenuButton sub7 = new MenuButton();
        sub7.setKey("sub7");
        sub7.setName("赞助加盟");
        sub7.setType(MenuType.VIEW);
        sub7.setUrl("https://open.weixin.qq.com/connect/oauth2/authorize?appid=wxdd7dda6d8a13b2a0&redirect_uri=http://www.sprotslm.com/info/message/toSaveMessage.action?message.type=2&response_type=code&scope=snsapi_userinfo&state=123#wechat_redirect");


        MenuButton sub8 = new MenuButton();
        sub8.setKey("sub8");
        sub8.setName("教练加盟");
        sub8.setType(MenuType.VIEW);
        sub8.setUrl("https://open.weixin.qq.com/connect/oauth2/authorize?appid=wxdd7dda6d8a13b2a0&redirect_uri=http://www.sprotslm.com/info/message/toSaveMessage.action?message.type=3&response_type=code&scope=snsapi_userinfo&state=123#wechat_redirect");

        List<MenuButton> list3 = new ArrayList<MenuButton>();
        list3.add(sub6);
        list3.add(sub7);
        list3.add(sub8);
        main3.setSubButton(list3);

        List<MenuButton> mainList = new ArrayList<MenuButton>();
        mainList.add(main1);
        mainList.add(main2);
        mainList.add(main3);
        
        //将主菜单加入请求对象
        request.setButton(mainList);
        LOG.debug(request.toJsonString());
        //创建菜单
        ResultType resultType = menuAPI.createMenu(request);
        LOG.debug(resultType.toString());
    }

    /**
     * 获取关注者列表
     *
     * @param config API配置
     */
    public void getUserList(ApiConfig config) {
        UserAPI userAPI = new UserAPI(config);
        GetUsersResponse users = userAPI.getUsers(null);
        LOG.debug("user count:{}", users.getCount());
        LOG.debug("user total:{}", users.getTotal());
        String[] openids = users.getData().getOpenid();
        for (String id : openids) {
            LOG.debug("id:{}", id);
        }
    }

    /**
     * 获取用户信息
     *
     * @param config API配置
     */
    public void getUserInfo(ApiConfig config) {
        UserAPI userAPI = new UserAPI(config);
        GetUserInfoResponse userInfo = userAPI.getUserInfo("oRbfiwvAZdTqpb2NKPrPDYIe-3ss");
        LOG.debug(userInfo.toJsonString());
    }

    public void uploadMedia(ApiConfig config) {
        MediaAPI mediaAPI = new MediaAPI(config);
        UploadMediaResponse response = mediaAPI.uploadMedia(MediaType.IMAGE, new File("E:/123.jpg"));
        LOG.debug(response.toJsonString());
    }

    public void downloadMedia(ApiConfig config) {
        MediaAPI mediaAPI = new MediaAPI(config);
        DownloadMediaResponse response = mediaAPI.downloadMedia("Kw0k6yeKxLaebweRwAUS2x08bcOx2nHMWAXO4s1lMpN_t5Fcsm-svrxe_EfGAgwo");
        LOG.debug("error:{}", response.getErrcode());
        try {
            response.writeTo(new FileOutputStream(new File("E:/222.jpg")));
        } catch (FileNotFoundException e) {
            LOG.error("异常", e);
        } catch (IOException e) {
            LOG.error("异常", e);
        }
    }

    public void getMenu(ApiConfig config) {
        MenuAPI api = new MenuAPI(config);
        GetMenuResponse response = api.getMenu();
        LOG.debug("菜单:{}", response.toJsonString());
    }

    public void addCustomAccount(ApiConfig config) {
        CustomAPI customAPI = new CustomAPI(config);
        CustomAccount customAccount = new CustomAccount();
        customAccount.setAccountName("peiyu@i-xiaoshuo");
        customAccount.setNickName("帅哥");
//        customAccount.setPassword("123456");
        ResultType resultType = customAPI.addCustomAccount(customAccount);
        LOG.debug("添加结果:{}", resultType.toString());
    }

    public void getOauthPageUrl(ApiConfig config) {
        OauthAPI oauthAPI = new OauthAPI(config);
        String pageUrl = oauthAPI.getOauthPageUrl("http://121.40.140.41/erhuluanzi/app/testGet", OauthScope.SNSAPI_BASE, "123");
        LOG.debug("pageUrl:{}", pageUrl);
    }

    public void getToken(ApiConfig config) {
        OauthAPI oauthAPI = new OauthAPI(config);
        OauthGetTokenResponse response = oauthAPI.getToken("041821d373d6a18679cb0b1d8d5cc1ez");
        LOG.debug("response:{}", response.toJsonString());
    }

    public void oauthGetUserInfo(ApiConfig config) {
        OauthAPI oauthAPI = new OauthAPI(config);
        GetUserInfoResponse response = oauthAPI.getUserInfo("OezXcEiiBSKSxW0eoylIeKoEzhGrPf8vRE3NugAdMy16Em-NimErLsOMfMlZBW0P0wauuYLIzl1soHnV-9CGvQtUYxmd3F6ruwjs_SQNw90aZd_yFlVc85P2FlC01QVNyRktVrSX5zHIMkETyjZojQ", "opZYwt-OS8WFxwU-colRzpu50eOQ");
        LOG.debug("response:{}", response.toJsonString());

    }

    public void testGetJsApiTicket(ApiConfig config){
        Assert.assertTrue(StrUtil.isNotBlank(config.getJsApiTicket()));
        if(StrUtil.isNotBlank(config.getJsApiTicket())){
            LOG.debug("ok");
        }
    }

    public void testJsApiSign(ApiConfig config){
//        try {
//            //使用JS-SDK的示例数据来测试
//            String exampleTestStr = JsApiUtil.sign("sM4AOVdWfPE4DxkXGEs8VMCPGGVi4C3VM0P37wVUCFvkVAy_90u5h9nbSlYy3-Sl-HhTdfl2fzFy1AOcHKP7qg", "Wm3WZYTPz0wzccnW", 1414587457l, "http://mp.weixin.qq.com");
//            //JS-SDK的示例结果
//            String exampleResult = "f4d90daf4b3bca3078ab155816175ba34c443a7b";
//            Assert.assertEquals(exampleTestStr, exampleResult);
//            if(exampleResult.equals(exampleTestStr))
//            {
//                LOG.debug("ok");
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
        JsAPI jsAPI = new JsAPI(config);
        GetSignatureResponse response = jsAPI.getSignature("http://mp.weixin.qq.com");
        LOG.debug(response.toJsonString());
    }

    public void getUserData(ApiConfig config) {
        DataCubeAPI dataAPI = new DataCubeAPI(config);
        String[] format = {"yyyy-MM-dd"};
        Date beginDate = DateUtils.parseDate("2015-01-01", format);
        Date endDate = DateUtils.parseDate("2015-01-07", format);
        GetUserSummaryResponse response = dataAPI.getUserSummary(beginDate, endDate);
        GetUserCumulateResponse cumulateResponse = dataAPI.getUserCumulate(beginDate, endDate);
        LOG.debug("-----------------getUserSummary---------------------");
        LOG.debug(response.toJsonString());
        LOG.debug("-----------------getUserCumulate---------------------");
        LOG.debug(cumulateResponse.toJsonString());
    }

    public void getArticleData(ApiConfig config) {
        DataCubeAPI dataCubeAPI = new DataCubeAPI(config);
        String[] format = {"yyyy-MM-dd"};
        Date beginDate = DateUtils.parseDate("2015-01-25", format);
        Date endDate = DateUtils.parseDate("2015-01-26", format);
        GetArticleSummaryResponse articleSummary = dataCubeAPI.getArticleSummary(endDate);
        GetArticleTotalResponse articleTotal = dataCubeAPI.getArticleTotal(endDate);
        GetUserReadResponse userRead = dataCubeAPI.getUserRead(beginDate, endDate);
        GetUserReadHourResponse userReadHour = dataCubeAPI.getUserReadHour(endDate);
        GetUserShareResponse userShare = dataCubeAPI.getUserShare(beginDate, endDate);
        GetUserShareHourResponse userShareHour = dataCubeAPI.getUserShareHour(endDate);
        LOG.debug("------------------articleSummary----------------------");
        LOG.debug(articleSummary.toJsonString());
        LOG.debug("------------------articleTotal----------------------");
        LOG.debug(articleTotal.toJsonString());
        LOG.debug("------------------userRead----------------------");
        LOG.debug(userRead.toJsonString());
        LOG.debug("------------------userReadHour----------------------");
        LOG.debug(userReadHour.toJsonString());
        LOG.debug("------------------userShare----------------------");
        LOG.debug(userShare.toJsonString());
        LOG.debug("------------------userShareHour----------------------");
        LOG.debug(userShareHour.toJsonString());
    }

    public void sendAllMessage(ApiConfig config){
        MediaAPI mediaAPI = new MediaAPI(config);
        UploadMediaResponse response = mediaAPI.uploadMedia(MediaType.IMAGE, new File("/Users/jileilei/Desktop/1.jpg"));
        String media_id = response.getMediaId();
        Article article = new Article(media_id, "测试用户", "群发测试", "http://www.baidu.com", "群发测试", "群发测试", Article.ShowConverPic.NO);
        UploadMediaResponse uploadMediaResponse = mediaAPI.uploadNews(Arrays.asList(article));
        MpNewsMsg mpNewsMsg = new MpNewsMsg();
        mpNewsMsg.setMediaId(uploadMediaResponse.getMediaId());
        MessageAPI messageAPI = new MessageAPI(config);
        GetSendMessageResponse messageResponse = messageAPI.sendMessageToUser(mpNewsMsg, true, "0", null);
        LOG.info("Send Message Id is " + messageResponse.getMsgId());
    }

    public void getUserGroups(ApiConfig config){
        UserAPI userAPI = new UserAPI(config);
        GetGroupsResponse response = userAPI.getGroups();
        for(Group group : response.getGroups()){
            System.out.println("Group id is " + group.getId() + ", name is " + group.getName() + ", count is " + group.getCount());
        }
    }
    
    //修改分组
    public void updateGroup(ApiConfig config) {
        UserAPI userAPI = new UserAPI(config);
        ResultType type = userAPI.updateGroup(103, "组别3");
        System.out.println(type.toString());
    }

    public void getCallbackIP(ApiConfig config) {
        SystemAPI systemAPI = new SystemAPI(config);
        List<String> callbackIP = systemAPI.getCallbackIP();
        LOG.debug("callbackIP:{}", callbackIP);
    }

    public void getShortUrl(ApiConfig config) {
        SystemAPI systemAPI = new SystemAPI(config);
        String shortUrl = systemAPI.getShortUrl("https://github.com/sd4324530/fastweixin");
        LOG.debug("getShortUrl:{}", shortUrl);
    }

//    @Test
    public void uploadImageMaterial(){
        MaterialAPI materialAPI = new MaterialAPI(config);
        UploadMaterialResponse response = materialAPI.uploadMaterialFile(new File("/Users/jileilei/Desktop/1.jpg"));
        System.out.println(response.getMediaId());
    }

//    @Test
    public void uploadNewsMaterial(){
        MaterialAPI materialAPI = new MaterialAPI(config);
        Article article = new Article("VnzJFSwv05ezhWSlU3kV6fmFYxHXaIHQMxx2SjX87fg", "测试", "测试", "http://www.baidu.com", "测试新闻。无意义", "测试新闻。无意义", Article.ShowConverPic.YES);
        UploadMaterialResponse response = materialAPI.uploadMaterialNews(Arrays.asList(article));
        System.out.println(response.getMediaId());
    }

//    @Test
    public void uploadVideoMaterial(){
        MaterialAPI materialAPI = new MaterialAPI(config);
        UploadMaterialResponse response = materialAPI.uploadMaterialFile(new File("/Users/jileilei/Downloads/movie.mp4"), "测试视频", "视频描述");
        System.out.println(response.getMediaId());
    }

//    @Test
    public void countMaterial(){
        MaterialAPI materialAPI = new MaterialAPI(config);
        GetMaterialTotalCountResponse response = materialAPI.countMaterial();
        System.out.println("video count : " + response.getVideo());
        System.out.println("voice count : " + response.getVoice());
        System.out.println("image count : " + response.getImage());
        System.out.println("news count : " + response.getNews());
    }

//    @Test
    public void batchGetMaterial(){
        MaterialAPI materialAPI = new MaterialAPI(config);
        GetMaterialListResponse response = materialAPI.batchGetMaterial(MaterialType.VIDEO, 0, 10);
        System.out.println("Total Count : " + response.getTotalCount());
        System.out.println("Item Count : " + response.getItemCount());
        for(Map<String, Object> item : response.getItems()){
            System.out.println("name : " + item.get("name"));
            System.out.println("media_id : " + item.get("media_id"));
        }
    }

//    @Test
    public void downloadMaterial(){
        MaterialAPI materialAPI = new MaterialAPI(config);
        // 此处是下载图片的文件
//        DownloadMaterialResponse response = materialAPI.downloadMaterial("VnzJFSwv05ezhWSlU3kV6fmFYxHXaIHQMxx2SjX87fg", MaterialType.IMAGE);
//        try {
//            FileOutputStream outputStream = new FileOutputStream(new File("/Users/jileilei/Desktop/2.jpg"));
//            response.writeTo(outputStream);
//        } catch (FileNotFoundException e) {
//            e.printStackTrace();
//        } catch (IOException e) {
//            e.printStackTrace();
//        }

        // 此处是下载的图文信息
//        DownloadMaterialResponse response = materialAPI.downloadMaterial("7jek93ZJrpO1nQgj_fbB2c4D8CNMMteoOc8Xbu9NSa0", MaterialType.NEWS);
        DownloadMaterialResponse response = materialAPI.downloadMaterial("i9U5WKsUVOngObxm_n2jITUHs45GtLSBCi44FJBCBEw", MaterialType.VIDEO);
        System.out.println("File name is " + response.getFileName());
        try {
            FileOutputStream fos = new FileOutputStream(new File("/Users/jileilei/" + response.getFileName()));
            response.writeTo(fos);
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

//    @Test
    public void deleteMaterial(){
        MaterialAPI materialAPI = new MaterialAPI(config);
        materialAPI.deleteMaterial("I8u5EjBNyq3Xd2J7bBrG9Of5HqAtchckbObf6GyyUL8");
        batchGetMaterial();
    }

//    @Test
    public void deleteMenu(){
        MenuAPI menuAPI = new MenuAPI(config);
        menuAPI.deleteMenu();
    }
}
