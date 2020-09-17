Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.

Permission is hereby granted, free of charge, to any person obtaining a copy of this
software and associated documentation files (the "Software"), to deal in the Software
without restriction, including without limitation the rights to use, copy, modify,
merge, publish, distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED,
INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A
PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

title "Sample Section"

aws_vpc_id = attribute("aws_vpc_id", default: "", description: "Optional AWS VPC identifier.")

# You add controls here
control "aws-single-vpc-exists-check" do # A unique ID for this control.
  only_if { aws_vpc_id != "" } # Only run this control if the `aws_vpc_id` attribute is provided.
  impact 1.0                                                                # The criticality, if this control fails.
  title "Check to see if custom VPC exists."                                # A human-readable title.
  describe aws_vpc(aws_vpc_id) do                                           # The test itself.
    it { should exist }
  end
end

# Plural resources can be inspected to check for specific resource details.
control "aws-vpcs-check" do
  impact 1.0
  title "Check in all the VPCs for default sg not allowing 22 inwards"
  aws_vpcs.vpc_ids.each do |vpc_id|
    describe aws_security_group(vpc_id: vpc_id, group_name: "default") do
      it { should allow_in(port: 22) }
    end
  end
end

control "aws-vpcs-multi-region-status-check" do                             # A unique ID for this control.
  impact 1.0                                                                # The criticality, if this control fails.
  title 'Check AWS VPCs in all regions have status "available"'             # A human-readable title.
  aws_regions.region_names.each do |region|                                 # Loop over all available AWS regions
    aws_vpcs(aws_region: region).vpc_ids.each do |vpc|                      # Find all VPCs in a single AWS region
      describe aws_vpc(aws_region: region, vpc_id: vpc) do                  # The test itself.
        it { should exist }                                                 # Confirms AWS VPC exists
        it { should be_available }                                          # Confirms AWS VPC has status "available"
      end
    end
  end
end
