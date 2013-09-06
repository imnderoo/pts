package pts

class Sample {

	String sampleId
	Double sampleVol
	Double dnaAmount
	String dnaSource
	String dnaType
	String dnaExtract
	String comment

	static hasMany = [sampleInPlate:SampleInPlate]

	static constraints = {
		sampleId size: 1..8, blank: false, unique: true
		sampleVol min: 0.0D
		dnaAmount min: 0.0D
		dnaSource size: 1..24
		dnaType size: 1..24
		dnaExtract size: 1..24
		comment size: 1..24
	}

	public String toString() {
		return sampleId
	}
}
