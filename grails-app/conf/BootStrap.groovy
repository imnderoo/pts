import pts.*

class BootStrap {
	
    def init = { servletContext ->
		environments
		{
			development
			{
				def investigator1 = new Investigator(firstName: 'Andrew', lastName: 'Wong').save(flush: true)
				
				def plateType1 = new PlateType(name: 'Plate96', row: '8', col: '12').save(flush: true)
				def plateType2 = new PlateType(name: 'Plate384', row: '16', col: '24').save(flush: true)
				
				def proj1 = new Project(name: 'TestProject1', investigator: investigator1).save(flush: true)
				def proj2 = new Project(name: 'TestProject2', investigator: investigator1).save(flush: true)
			}
		}
    }
    def destroy = {
    }
}
