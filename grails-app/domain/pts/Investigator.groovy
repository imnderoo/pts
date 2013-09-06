package pts

class Investigator {

	String firstName
	String lastName
	
	static hasMany = [project: Project]
	
    static constraints = {
		firstName size: 1..24, blank: false, nullable: false
		lastName nullable: true
    }
	
	static mapping = {
		project cascade: 'save-update'
	}
	
	public String toString()
	{
		return firstName + " " + lastName
	}
}
