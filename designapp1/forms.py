from django import forms


class RegisterForm(forms.Form):
    # TODO: validate emails are emails via regex (possibly do this in frontend)
    mail = forms.CharField(
        widget=forms.EmailInput(
            attrs={
                'class': 'form-control my-1',
                'id': 'register-email-field',
                'autofocus': 'True',
            }
        ), required=True, label='email', max_length=256
    )
    password = forms.CharField(
        widget=forms.PasswordInput(
            attrs={
                'class': 'form-control',
                'id': 'register-password-field',

            }
        ), required=True, label='password')

    passwordConfirm = forms.CharField(
        widget=forms.PasswordInput(
            attrs={
                'class': 'form-control',
                'id': 'register-password-confirm-field'
            }
        ), required=True, label="confirm password")

    def validate(self):
        data = self.cleaned_data

        if (data["password"] != data["passwordConfirm"]):
            raise forms.ValidationError("passwords do not match")


class LoginForm(forms.Form):
    mail = forms.CharField(
        widget=forms.TextInput(
            attrs={
                'class': 'form-control mb-4',
                'placeholder': 'E-Mail Address',
                'autofocus': True,
                'id': 'email-input'
            }
        ), max_length=100, required=True, label=''
    )
    password = forms.CharField(
        widget=forms.PasswordInput(
            attrs={
                'class': 'form-control mb-4',
                'placeholder': 'Password',
                'id': 'password-input'
            }
        ), required=True, label=''
    )
