package com.kidinfor.fastweixin.api.response;

import java.util.List;

import com.kidinfor.fastweixin.api.entity.UpstreamMsg;

/**
 * @author peiyu
 */
public class GetUpstreamMsgResponse extends BaseResponse {

    private List<UpstreamMsg> list;

    public List<UpstreamMsg> getList() {
        return list;
    }

    public void setList(List<UpstreamMsg> list) {
        this.list = list;
    }
}
