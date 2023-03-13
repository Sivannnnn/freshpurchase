package com.sivan.entity.request;

import lombok.Data;
import lombok.ToString;

@ToString
@Data
public class LoginParam {

    private String username;
    private String password;
    private String code;
    private String token;

}
