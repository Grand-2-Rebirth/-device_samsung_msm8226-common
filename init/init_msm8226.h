/*
#
# Copyright (C) 2022 ArrowOS
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
 */

#ifndef __INIT_MSM8226__H__
#define __INIT_MSM8226__H__

void cdma_properties(char const operator_alpha[],
        char const operator_numeric[],
        char const default_cdma_sub[],
        char const default_network[]);
void gsm_properties(char const default_network[],
        char const lteOnGsmDevice[]);
void init_target_properties();
void property_override(char const prop[], char const value[], bool add=false);
void set_ro_product_prop(char const prop[], char const value[]);

#endif /* __INIT_MSM8226__H__ */
