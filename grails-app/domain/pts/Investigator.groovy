package pts

class Investigator {

	String firstName
	String lastName

	static hasMany = [project: Project]

	static constraints = {
		firstName size: 1..24, blank: false, nullable: false
		lastName nullable: true
		firstName (unique: 'lastName')
	}

	static mapping = {
		sort lastName: "asc"
		project cascade: 'save-update'
	}

	public String toString() {
		return lastName + ", " + firstName
	}
}
