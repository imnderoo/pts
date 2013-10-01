package pts

class Project {
	String name
	Investigator investigator

	static hasMany = [plate:Plate]
	static belongsTo = [investigator:Investigator]

	static constraints = {
		name size: 1..24, blank: false
		investigator blank: false, nullable: false

		name (unique: 'investigator')
	}

	public String toString() {
		return name
	}
}
