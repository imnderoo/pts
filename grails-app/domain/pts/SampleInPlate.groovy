package pts

class SampleInPlate {

	String well
	String result
	String status
	
	static belongsTo = [sample:Sample, plate:Plate]

    static constraints = {
		well blank: false, nullable: false, unique: 'plate'
	}
	
	public String toString() {
		return plate + "-" + well + ":" + sample
	}
}
