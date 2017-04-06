package com.kidinfor.fastweixin.api.response;

import java.util.List;

import com.kidinfor.fastweixin.api.entity.Tag;

/**
 * @author peiyu
 * @since 1.3.9
 */
public class GetAllTagsResponse extends BaseResponse {

    private List<Tag> tags;

    public List<Tag> getTags() {
        return tags;
    }

    public void setTags(List<Tag> tags) {
        this.tags = tags;
    }
}
