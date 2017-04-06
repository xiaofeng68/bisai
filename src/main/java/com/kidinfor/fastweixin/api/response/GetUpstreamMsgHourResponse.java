package com.kidinfor.fastweixin.api.response;

import java.util.List;

import com.kidinfor.fastweixin.api.entity.UpstreamMsgHour;

/**
 * @author peiyu
 */
public class GetUpstreamMsgHourResponse extends BaseResponse {

    private List<UpstreamMsgHour> list;

    public List<UpstreamMsgHour> getList() {
        return list;
    }

    public void setList(List<UpstreamMsgHour> list) {
        this.list = list;
    }
}
