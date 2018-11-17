package com.shenxuan.admin;

import com.shenxuan.common.config.FileServiceConfig;
import com.shenxuan.common.service.IUserService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

@RunWith(SpringRunner.class)
@SpringBootTest
public class AdminApplicationTests {

	@Autowired
	private IUserService userService;

	@Autowired
	private FileServiceConfig fileServiceConfig;

	@Test
	public void contextLoads() {
		String serverurl = fileServiceConfig.getServerurl();
		System.out.println(serverurl);
		/*UserCustom userCustom = userService.selectByUsername("1231");
		System.out.println(userCustom);
		UserCustom userCustom1=new UserCustom();
		userCustom1.setBusinessName("123");
		System.out.println(userCustom1);
*/
	}

}
