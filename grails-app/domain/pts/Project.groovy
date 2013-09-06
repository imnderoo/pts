package pts

class Project {
	String name
	Investigator investigator
	
	static hasMany = [plate:Plate]
	
    static constraints = {
		name size: 1..24, blank: false, unique: true
		investigator blank: false, nullable: false
    }
	
	public String toString()
	{
		return name
	}
}
