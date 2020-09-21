# Test our Windows Jump Hosts Security Groups
describe aws_security_group(group_name: input("WindowsEC2SG")) do
  it { should exist }
  it { should allow_in(port: 443, ipv4_range: '10.189.0.0/20') }
  it { should allow_in(port: 80, ipv4_range: '10.189.0.0/20') }
  it { should_not allow_in(port: 389, ipv4_range: '0.0.0.0/0') }
end

# Test our VPC Endpoint Security Group
describe aws_security_group(group_name: input("VpcEndpointSG")) do
  it { should exist }
  it { should allow_in(port: 443, ipv4_range: '0.0.0.0/0') }
end

# Test our IAM Roles attached policies and availability
describe aws_iam_role(role_name: input("CodePipelineRole")) do
  it { should exist }
end

# Test our IAM Policy and ensure that it has the necessary statements
describe aws_iam_policy(policy_name: input("CodePipelineBase")) do
  it { should_not have_statement(Action: 'kms:*') }
  it { should_not have_statement(Action: 'iam:*') }
  it { should have_statement(Action: 'codepipeline:*') }
  it { should be_attached_to_role('cassis-CodePipelineRole') }
  it { should exist }
end
