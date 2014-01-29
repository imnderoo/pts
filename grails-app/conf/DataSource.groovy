dataSource {
	pooled = true
	driverClassName = "com.mysql.jdbc.Driver"


	properties {

		maxActive = 10
		maxIdle = 5
		minIdle = 2
		initialSize = 2
		minEvictableIdleTimeMillis = 60000
		timeBetweenEvictionRunsMillis = 60000
		maxWait = 10000
		testWhileIdle = true
		validationQuery = "select 1 "
	}
}
hibernate {
	cache.use_second_level_cache=true
	cache.use_query_cache=true
	cache.provider_class='net.sf.ehcache.hibernate.EhCacheProvider'

	dialect='org.hibernate.dialect.MySQL5InnoDBDialect'
}
// environment specific settings
environments {
	development {
		dataSource {
			username = "root"
			password = "1000anag3r"

			url = "jdbc:mysql://localhost/ptrack"

			dbCreate = "update"
		}
	}
	production {
		dataSource {

			username = "root"
			password = "1000anag3r"

			url = "jdbc:mysql://localhost/ptrack" // Uncomment when deploying

			dbCreate = "update"
		}
	}

}