package com.kidinfor.fastweixin;

import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;

import com.kidinfor.fastweixin.api.enums.MediaType;
import com.kidinfor.fastweixin.company.api.*;
import com.kidinfor.fastweixin.company.api.config.QYAPIConfig;
import com.kidinfor.fastweixin.company.api.entity.*;
import com.kidinfor.fastweixin.company.api.enums.QYMenuType;
import com.kidinfor.fastweixin.company.api.enums.QYResultType;
import com.kidinfor.fastweixin.company.api.response.*;
import com.kidinfor.fastweixin.company.message.QYArticle;
import com.kidinfor.fastweixin.company.message.QYNewsMsg;
import com.kidinfor.fastweixin.company.message.QYTextMsg;
import com.kidinfor.fastweixin.util.CollectionUtil;
import com.kidinfor.fastweixin.util.JSONUtil;

import java.io.File;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 *  
 *  ====================================================================
 *  上海聚攒软件开发有限公司
 *  --------------------------------------------------------------------
 *  @author Nottyjay
 *  @version 1.0.beta
 *  ====================================================================
 */
public class QYFastweixinTest {

    private QYAPIConfig config;

    @Before
    public void initConfig(){
        String corpId = "wx927b678d5dd1616e";
        String corpSecret = "IP2BwR260wSszwmbbr3MGf3RzTjEDyRcsvUrOgQsyQ7MoFKjju4f2_QfZaAHM8rP";
        config = new QYAPIConfig(corpId, corpSecret);
    }

//    @Test
    public void getDepartmentList(){
        QYDepartmentAPI departmentAPI = new QYDepartmentAPI(config);
        GetDepartmentListResponse response = departmentAPI.getList(null);
        for(QYDepartment department : response.getDepartments()){
            System.out.println(department.toString());
        }
    }

//    @Test
    public void createDepartment(){
        QYDepartmentAPI departmentAPI = new QYDepartmentAPI(config);
        QYDepartment department = new QYDepartment("API创建部门", 2, 1);
        CreateDepartmentResponse response = departmentAPI.create(department);
        System.out.println(response.toString());
    }

//    @Test
    public void updateDepartment(){
        QYDepartmentAPI departmentAPI = new QYDepartmentAPI(config);
        QYDepartment department = new QYDepartment(3, "API更新部门", 2, 1);
        QYResultType resultType = departmentAPI.update(department);
        System.out.println(resultType.toString());
        GetDepartmentListResponse response = departmentAPI.getList(null);
        for(QYDepartment department2 : response.getDepartments()){
            System.out.println(department2.toString());
        }
    }

//    @Test
    public void deleteDepartment(){
        QYDepartmentAPI departmentAPI = new QYDepartmentAPI(config);
        QYResultType resultType = departmentAPI.delete(3);
        System.out.println(resultType.toString());
    }

//    @Test
    public void createUser(){
        QYUserAPI userAPI = new QYUserAPI(config);
        QYUser user = new QYUser("ceshi", "测试1", new Integer[]{2}, "主管", "18912267607", QYUser.Gender.MAN, "891084418@qq.com", "", null);
        QYResultType resultType = userAPI.create(user);
        System.out.println(resultType.toString());
    }

//    @Test
    public void getUserList(){
        QYUserAPI userAPI = new QYUserAPI(config);
        GetQYUserInfo4DepartmentResponse response = userAPI.getList(1, false, 0);
        if("0".equals(response.getErrcode())) {
            List<QYUser> users = response.getUserList();
            for (QYUser user : users) {
                Integer[] departments = user.getDepartment();
                for (Integer departmentId : departments) {
                    System.out.println(user.getName() + ":\t" + departmentId);
                }
            }
        }else{
            System.out.println(QYResultType.get(response.getErrcode()).getDescription());
        }
    }

//    @Test
    public void sendMessage(){
        QYTextMsg qyTextMsg = new QYTextMsg();
        qyTextMsg.setText(new QYTextMsg.Text("测试消息"));
        qyTextMsg.setToUser("@all");
        qyTextMsg.setAgentId("1");
        QYMessageAPI messageAPI = new QYMessageAPI(config);
        GetQYSendMessageResponse response = messageAPI.send(qyTextMsg);
    }

//    @Test
    public void sendNewsMessage() {
        QYNewsMsg msg = new QYNewsMsg();
        msg.setToUser("touser");
        msg.setToParty("toparty");
        msg.setToTag("totag");
        msg.setMsgType("news");
        msg.setAgentId("1");
        QYArticle article = new QYArticle("t", "d", "p", "u");
        QYArticle article2 = new QYArticle("t2", "d2", "p2", "u2");
        msg.setArticles(CollectionUtil.newArrayList(article, article2));
        System.out.println(JSONUtil.toJson(msg));
    }

//    @Test
    public void getAllAgent(){
        QYAgentAPI agentAPI = new QYAgentAPI(config);
        GetQYAgentListResponse response = agentAPI.getAll();
        for(QYAgent agent : response.getAgentList()){
            System.out.println(agent.toString());
        }
    }

//    @Test
    public void getAgentInfo(){
        QYAgentAPI agentAPI = new QYAgentAPI(config);
        GetQYAgentInfoResponse response = agentAPI.getInfo("1");
        System.out.println(response.getQyAgent().toString());
    }

//    @Test
    public void uploadMedia(){
        // 先要上传一个LOGO
        String logoUrl = "/Users/jileilei/Desktop/1.jpg";
        QYMediaAPI mediaAPI = new QYMediaAPI(config);
        UploadMediaResponse response1 = mediaAPI.upload(MediaType.IMAGE, new File(logoUrl));
        System.out.println(response1.getMediaId()); //1JsGQDLLuB02U0s6LftUVZURGWJwwrchKDfihbW2JOvb9hMVaDNL94W8aGdgfJu55wMm8FDUdvhXMwz7g6ZzgzA
    }

//    @Test
    public void createAgent(){
        QYAgent agent = new QYAgent("2", "测试应用", "测试应用", "http://www.8228.cn", 0, 0, 0);
        String mediaId = "1JsGQDLLuB02U0s6LftUVZURGWJwwrchKDfihbW2JOvb9hMVaDNL94W8aGdgfJu55wMm8FDUdvhXMwz7g6ZzgzA";
        QYAgentAPI agentAPI = new QYAgentAPI(config);
        QYResultType resultType = agentAPI.create(agent, mediaId);
        System.out.println(resultType.toString());
    }

//    @Test
    public void createTag(){
        QYTagAPI tagAPI = new QYTagAPI(config);

        QYTag tag = new QYTag("开发");
        CreateTagResponse response = tagAPI.create(tag);
        Assert.assertNotNull(response.getTagid());
    }

//    @Test
    public void deleteTag(){
        QYTagAPI tagAPI = new QYTagAPI(config);
        QYResultType resultType = tagAPI.delete(1);
        Assert.assertEquals(Integer.valueOf(0), resultType.getCode());
    }

//    @Test
    public void getTagInfo(){
        QYTagAPI tagAPI = new QYTagAPI(config);
        GetTagInfoResponse response = tagAPI.get(1);
        Assert.assertEquals(Integer.valueOf(0), Integer.valueOf(response.getErrcode()));
    }

//    @Test
    public void addTagUser(){
        QYTagAPI tagAPI = new QYTagAPI(config);
        AddTagUsersResponse response = tagAPI.addTagUsers(1, Arrays.asList("CLY123", "CLY"), null);
        System.out.println(response.getInvalidlist());
        Assert.assertEquals(Integer.valueOf(0), Integer.valueOf(response.getErrcode()));
    }

//    @Test
    public void delTagUser(){
        QYTagAPI tagAPI = new QYTagAPI(config);
        DelTagUsersResponse response = tagAPI.delTagUsers(1, Arrays.asList("CLY", "CLY123"), null);
        System.out.println(response.getInvalidlist());
        Assert.assertEquals(Integer.valueOf(0), Integer.valueOf(response.getErrcode()));
    }

//    @Test
    public void listTag(){
        QYTagAPI tagAPI = new QYTagAPI(config);
        GetTagListResponse response = tagAPI.list();
        Assert.assertEquals(Integer.valueOf(0), Integer.valueOf(response.getErrcode()));
    }

    @Test
    public void createMenu(){
        QYMenu menu = new QYMenu();
        //
        QYMenuButton mbutton1 = new QYMenuButton();
        mbutton1.setType(QYMenuType.CLICK);
        mbutton1.setName("考试系统");
        List<QYMenuButton> subButtons1 = new ArrayList<QYMenuButton>();
        QYMenuButton sbutton11 = new QYMenuButton();
        sbutton11.setType(QYMenuType.VIEW);
        sbutton11.setName("考试系统");
        sbutton11.setUrl("http://120.24.47.142/phpems/index.php?content-phone");
        subButtons1.add(sbutton11);
        QYMenuButton sbutton12 = new QYMenuButton();
        sbutton12.setType(QYMenuType.VIEW);
        sbutton12.setName("注册");
        sbutton12.setUrl("http://120.24.47.142/WeChat/bind.html");
        subButtons1.add(sbutton12);
        QYMenuButton sbutton13 = new QYMenuButton();
        sbutton13.setType(QYMenuType.VIEW);
        sbutton13.setName("在线考试");
        sbutton13.setUrl("http://120.24.47.142/finance/phone/apple/login.jsp");
        subButtons1.add(sbutton13);
        mbutton1.setSubButton(subButtons1);
        menu.addButton(mbutton1);
        //
        QYMenuButton mbutton2 = new QYMenuButton();
        mbutton2.setType(QYMenuType.CLICK);
        mbutton2.setName("课程学习");
        List<QYMenuButton> subButtons2 = new ArrayList<QYMenuButton>();
        QYMenuButton sbutton21 = new QYMenuButton();
        sbutton21.setType(QYMenuType.VIEW);
        sbutton21.setName("测试");
        sbutton21.setUrl("http://120.24.47.142/wap");
        subButtons2.add(sbutton21);
        QYMenuButton sbutton22 = new QYMenuButton();
        sbutton22.setType(QYMenuType.VIEW);
        sbutton22.setName("课程资源");
        sbutton22.setUrl("http://120.24.47.142");
        subButtons2.add(sbutton22);
        mbutton2.setSubButton(subButtons2);
        menu.addButton(mbutton2);
        
        QYMenuAPI menuAPI = new QYMenuAPI(config);
        menuAPI.delete("4");
        QYResultType resultType = menuAPI.create(menu, "4");
        Assert.assertEquals(Integer.valueOf(0), resultType.getCode());
    }

    @Test
    public void listMenu(){
        QYMenuAPI menuAPI = new QYMenuAPI(config);
        GetQYMenuResponse response = menuAPI.list("0");
        Assert.assertNotEquals(Integer.valueOf(0), Integer.valueOf(response.getMenu().getButton().size()));
    }

//    @Test
    public void deleteMenu(){
        QYMenuAPI menuAPI = new QYMenuAPI(config);
        QYResultType resultType = menuAPI.delete("0");
        Assert.assertEquals(Integer.valueOf(0), resultType.getCode());
    }


}
