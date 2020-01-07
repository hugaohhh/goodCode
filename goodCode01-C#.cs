 

AdminUser 和 GeneralUser 都继承 User 下面代码表示创建一个 admin时 UserType 为 admin
创建 GeneralUser 时 userType 就是 general
 modelBuilder.Entity<User>()
	.HasDiscriminator<string>("UserType")
	.HasValue<AdminUser>("admin")
	.HasValue<GeneralUser>("general");
	
	
	
	