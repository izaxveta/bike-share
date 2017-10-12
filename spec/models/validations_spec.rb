# require "./app/models/station"
# require './app/models/trip'
# require './app/models/condition'
# require './spec/spec_helper'
#
# dummy_data = {
#     Station => {
#       dock_count: 5,
#       city: "San Francisco",
#       name: "bike pile",
#       installation_date: ("1/1/2017"),
#       lat: 37.332808,
#       long: -121.883890
#     },
#     Trip => {
#       duration: 8,
#       start_date: "01/01/2017",
#       start_station_id: 4,
#       end_date: "01/01/2017",
#       end_station_id: 5,
#       bike_id: 404,
#       subscription_type: "Yearly"
#     },
#     Condition => {
#       date: '1/1/2017',
#       max_temperature_f: 75.0,
#       mean_temperature_f: 73.0,
#       min_temperature_f: 71.0,
#       mean_humidity: 75.0,
#       mean_visibility_miles: 10.0,
#       mean_wind_speed_mph: 10.0,
#       precipitation_inches: 0
#     }
#   }
#
#   dummy_data.each do |model, data|
#     describe model do
#
#       before do
#         @data = data.dup
#       end
#
#       it "is valid with all required properties" do
#         record = model.new(@data)
#         expect(record).to be_valid
#       end
#       context "is not valid without property" do
#         data.keys.each do |property|
#           it(property) do
#             @data.delete property
#             record = model.new(@data)
#             expect(record).to_not be_valid
#           end
#         end
#       end
#     end
#   end
