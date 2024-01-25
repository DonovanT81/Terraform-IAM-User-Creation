provider "aws" {
    region = "<Preferred Region"
    access_key = "<Access Key>"
    secret_key = "<Secret Key>"
}

resource "aws_iam_user" "<Preffered Name>" {
    name = "<Name>"
    tags = {
        Description = "Technical Team Leader"
    }
}



 /* EOF = End of FIle. Use Delimiter to add JSON file for Admin Access*/
/*Creates IAM Policy*/
resource "aws_iam_policy" "<Preffered Name>" {
    name = "AdminUsers"
    policy = <<EOF
{
	"Statement": [{
		"Action": "*",
		"Effect": "Allow",
		"Resource": "*"
	}],
	"Version": "2012-10-17"
}

    EOF
}

resource "aws_iam_user_policy_attachment" "<Preffered Name>" {
    user = aws_iam_user.admin-user.name 
    policy_arn = aws_iam_policy.adminUsers.arn

}