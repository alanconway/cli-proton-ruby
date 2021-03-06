#--
# Copyright 2017 Red Hat Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#++

require 'qpid_proton'

module Handlers

  # Basic events handler for all clients
  class BasicHandler < Qpid::Proton::MessagingHandler

    # URI of broker
    attr_accessor :broker
    # Allowed SASL mechs
    attr_accessor :sasl_mechs

    # Initialization of basic events handler for all clients
    # ==== Basic events handler arguments
    # broker:: URI of broker
    # sasl_mechs: allowed SASL mechanisms
    def initialize(broker, sasl_mechs)
      super()
      # Save URI of broker
      if broker.is_a? URI::AMQP or broker.is_a? URI::AMQPS
        @broker = broker
      else
        @broker = Qpid::Proton.uri(broker)
      end
      # Save allowed SASL mechanisms
      @sasl_mechs = sasl_mechs
    end

  end # class BasicHandler

end # module Handlers

# eof
