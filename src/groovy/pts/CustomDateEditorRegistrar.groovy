package pts

import java.text.SimpleDateFormat

import org.springframework.beans.PropertyEditorRegistrar
import org.springframework.beans.PropertyEditorRegistry
import org.springframework.beans.propertyeditors.CustomDateEditor

public class CustomDateEditorRegistrar implements PropertyEditorRegistrar {

	public void registerCustomEditors(PropertyEditorRegistry registry) {

		String dateFormat = 'dd-MM-yyyy'
		registry.registerCustomEditor(Date, new CustomDateEditor(new SimpleDateFormat(dateFormat), true))
	}
}