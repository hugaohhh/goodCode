 

AdminUser 和 GeneralUser 都继承 User 下面代码表示创建一个 admin时 UserType 为 admin
创建 GeneralUser 时 userType 就是 general
 modelBuilder.Entity<User>()
	.HasDiscriminator<string>("UserType")
	.HasValue<AdminUser>("admin")
	.HasValue<GeneralUser>("general");
	
	添加复合唯一键的方式
modelBuilder.Entity<DeviceGroup>()
                .HasAlternateKey(dg => new {
                    dg.OrganizationId, dg.OsType, dg.Version
                }).HasName("DeviceGroup_Code_UQ");
				
 public void InsertTestData()
        {
            var organization = new Organization
            {
                Code = "OrganizationCode1",
                Name = "OrganizationName1",
                Address = "OrganizationAddress1",
                DelegatePhone = "123465789",
                AdminPhone = "987654321",
                AdminMail = "Organization1@xx.com",
                StartDay = DateTime.Now,
                EndDay = DateTime.Now,
                Url = "Organization1.co.jp",
                IsValid = true,
            };
            var deviceGroup = new DeviceGroup
            {
                Version = "1.1",
                OsType = "Window10",
                Organization = organization
            };
            var lte = new Lte
            {
                LteName = "Lte1",
                LteAdapter = "LteAdapter1",
                SoftwareRadioState = true
            };
            var device = new Device
            {
                DeviceName = "Device1",
                DeviceImei = "DeviceImei1",
                ManagerNumber = "DeviceManager1",
                Type = "DeviceType1",
                Lte = lte,
                DeviceGroup = deviceGroup
            };
            var simGroup = new SimGroup
            {
                SimGroupName = "SimGroup1",
                Organization = organization,
                PrimaryDns = "255.0.0.0",
                SecondDns = "255.0.0.1",
                Apn = "SimGroupApn1",
                NasAddress = "127.0.0.0",
                Nw1AddressPool = "127.0.0.2",
                Nw1AddressRange = "127.0.0.2-127.1.1.2",
                ServerAddress = "127.0.0.1"
            };
            var sim = new Sim
            {
                Msisdn = "02017911000",
                Imsi = "440103213100000",
                IccId = "8981100005819480000",
                SimGroup = simGroup
            };
            var simDevice = new SimDevice
            {
                Sim = sim,
                Device = device,
                Nw2AddressPool = "127.1.1.3",
                StartDay = DateTime.Now,
                EndDay = DateTime.Now,
                AuthPeriod = 1
            };

            _authenticationRepository.Create(organization, simGroup, sim, deviceGroup, device, lte, simDevice);

        }
		
		
		  public void Create(Organization organization, SimGroup simGroup, Sim sim, DeviceGroup deviceGroup, Device device, Lte lte, SimDevice simDevice)
        {
            organization.SimGroups.Add(simGroup);
            organization.DeviceGroups.Add(deviceGroup);
            lte.Devices.Add(device);
            deviceGroup.Devices.Add(device);
            simGroup.Sims.Add(sim);
            //_dbContext.Organization.Add(organization);
            _dbContext.AddRange(organization,lte,deviceGroup,simGroup,device,sim,simDevice);
            _dbContext.SaveChanges();
        }
				
	
	
	
	