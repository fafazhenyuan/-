package priv.yuan.entity;

import lombok.*;

import java.io.Serializable;

/**
 * (Manager)实体类
 *
 * @author makejava
 * @since 2020-04-01 15:00:13
 */
@Setter
@Getter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class Manager implements Serializable {
    private static final long serialVersionUID = -17994389232051196L;
    /**
    * 管理员id
    */
    private Long managerId;
    /**
    * 管理员姓名
    */
    private String managerName;
    /**
    * 管理员密码
    */
    private String managerPasswd;


}