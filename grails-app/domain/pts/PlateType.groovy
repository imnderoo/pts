package pts

class PlateType {

	String name
	Integer row
	Integer col
	
    static constraints = {
		name unique: true, blank: false, nullable: false
		row min: 0, max: 50, nullable: false
		col min: 0, max: 50, nullable: false
    }

	public String toString()
	{
		return name
	}
}
