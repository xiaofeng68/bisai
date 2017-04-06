package com.kidinfor.fastweixin.api.response;

import java.util.List;

import com.kidinfor.fastweixin.api.entity.UpstreamMsgDistWeek;

/**
 * @author peiyu
 */
public class GetUpstreamMsgDistWeekResponse extends BaseResponse {

    private List<UpstreamMsgDistWeek> list;

    public List<UpstreamMsgDistWeek> getList() {
        return list;
    }

    public void setList(List<UpstreamMsgDistWeek> list) {
        this.list = list;
    }
}
