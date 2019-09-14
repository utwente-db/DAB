from django import forms

class RegisterForm(forms.Form):
	#TODO: validate emails are emails via regex (possibly do this in frontend)
	mail = forms.CharField(max_length=256, required=True, label="email")
	password = forms.CharField(widget=forms.PasswordInput, required=True, label="password")
	passwordConfirm = forms.CharField(widget=forms.PasswordInput, required=True, label="confirm password")

	def validate(self):
		data = self.cleaned_data

		if(data["password"] != data["passwordConfirm"]):
			raise forms.ValidationError("passwords do not match")

class LoginForm(forms.Form):
	mail = forms.CharField(max_length=100, required=True, label="email")
	password = forms.CharField(widget=forms.PasswordInput, required=True, label="password")