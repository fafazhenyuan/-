package priv.yuan.entity;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.*;

import java.io.Serializable;

/**
 * (User)实体类
 *
 * @author makejava
 * @since 2020-04-01 15:00:13
 */
@Setter
@Getter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class User implements Serializable {
    private static final long serialVersionUID = -52766254443743090L;
    /**
    * 用户id
    */
    private Long userId;
    /**
    * 用户名
    */
    @JsonProperty
    private String userName;
    /**
     * 用户真实姓名
     */
    @JsonProperty
    private String realName;
    /**
    * 用户密码
    */
    @JsonProperty
    private String userPasswd;
    /**
    * 年龄
    */
    @JsonProperty
    private Integer age;
    /**
    * 性别，0代表男，1代表女
    */
    @JsonProperty
    private Integer gender;
    /**
    * 邮箱
    */
    @JsonProperty
    private String email;
    /**
    * 电话
    */
    @JsonProperty
    private String phone;
    /**
    * 地址
    */
    @JsonProperty
    private String adress;

}