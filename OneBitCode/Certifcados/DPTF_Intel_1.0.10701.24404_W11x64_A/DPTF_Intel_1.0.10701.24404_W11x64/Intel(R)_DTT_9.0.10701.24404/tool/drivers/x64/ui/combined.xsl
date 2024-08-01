<!--
///////////////////////////////////////////////////////////////////////////////
// Copyright (c) 2013-2021 Intel Corporation All Rights Reserved
//
// Licensed under the Apache License, Version 2.0 (the "License"); you may not
// use this file except in compliance with the License.
//
// You may obtain a copy of the License at
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
// WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//
// See the License for the specific language governing permissions and
// limitations under the License.
//
///////////////////////////////////////////////////////////////////////////////
-->
<!-- begin xsl -->
<?xml version="1.0" encoding="ISO-8859-1"?>
<!-- format_id=3E-58-63-46-F8-F7-45-4A-A8-F7-DE-7E-C6-F7-61-A8 -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/manager_policy_status">
		<div>
			<table id="monitor-manager-policy-status-table" border="1" style="float:left;">
				<tr bgcolor="#00AEEF" colspan="2">
					<th colspan="2">Policies (IDSP)</th>
				</tr>
				<tr id="monitor-manager-policy-status-table-header-row" bgcolor="#00AEEF">
					<th>Index</th>
					<th>Name</th>
				</tr>
				<xsl:for-each select="policies/policy">
					<tr>
						<td align='right'>
							<xsl:value-of select="policy_index" />
						</td>
						<td>
							<xsl:value-of select="policy_name" />
						</td>
					</tr>
				</xsl:for-each>
			</table>

			<xsl:if test="count(platform_request_handler/request) &gt; 0">
				<table id="monitor-manager-platform-request-status-table" border="1" style="float:right;">
					<tr bgcolor="#00AEEF" colspan="2">
						<th colspan="2">Platform Requests</th>
					</tr>
					<tr id="monitor-manager-platform-request-status-table-header-row" bgcolor="#00AEEF">
						<th>Name</th>
						<th>Last Set Value</th>
					</tr>
					<xsl:for-each select="platform_request_handler/request">
						<tr>
							<td align='right'>
								<xsl:value-of select="name" />
							</td>
							<td>
								<xsl:value-of select="value" />
							</td>
						</tr>
					</xsl:for-each>
				</table>
			</xsl:if>

			<table id="monitor-manager-osc-request-status-table" border="1" style="float:right;">
				<tr bgcolor="#00AEEF" colspan="3">
					<th colspan="3">Arbitrated _OSC Request</th>
				</tr>
				<tr id="monitor-manager-osc-arbitrated-request-status-table-header-row" bgcolor="#00AEEF">
					<th>Bit Value</th>
					<th colspan="2">Description</th>
				</tr>
				<tr>
					<td align='center'>
						<xsl:value-of select="platform_request_handler/osc_arbitrator_status/arbitrated/arbitrated_value" />
					</td>
					<td colspan="2">
						<xsl:value-of select="platform_request_handler/osc_arbitrator_status/arbitrated/description" />
					</td>
				</tr>
				<xsl:if test="count(platform_request_handler/osc_arbitrator_status/requests/request) &gt; 0">
					<tr bgcolor="#00AEEF" colspan="3">
						<th colspan="3">Policy _OSC Requests</th>
					</tr>
					<tr id="monitor-manager-osc-policy-request-status-table-header-row" bgcolor="#00AEEF">
						<th>Policy Name</th>
						<th>Requested Value</th>
						<th>Description</th>
					</tr>
					<xsl:for-each select="platform_request_handler/osc_arbitrator_status/requests/request">
						<tr>
							<td>
								<xsl:value-of select="policy_name" />
							</td>
							<td align='center'>
								<xsl:value-of select="requested_value" />
							</td>
							<td>
								<xsl:value-of select="description" />
							</td>
						</tr>
					</xsl:for-each>
				</xsl:if>
			</table>
		</div>
	</xsl:template>
</xsl:stylesheet>
<!-- end xsl -->

<!-- begin xsl -->
<?xml version="1.0" encoding="ISO-8859-1"?>
<!-- format_id=98-3F-90-5D-9E-39-93-4D-BC-CD-A1-A5-8F-61-18-5F -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/manager_participant_status">
		<table id="monitor-manager-temperature-trip-point-table" border="1">
			<tr bgcolor="#00AEEF" colspan="24">
				<th colspan="24" style="border:none">Participants</th>
			</tr>
			<tr bgcolor="#00AEEF" colspan="24">
				<th colspan="9"></th>
				<th colspan="3" style="border-left:thick solid; border-top:thick solid">Critical Policy Trip Points (&#8451;)</th>
				<th colspan="2" style="border-left:thick solid; border-top:thick solid">Passive Policy Trip Points (&#8451;)</th>
				<th colspan="10" style="border-left:thick solid; border-right:thick solid; border-top:thick solid">Active Policy Trip Points (&#8451;)</th>
			</tr>
			<tr id="monitor-manager-temperature-trip-point-table-header-row" bgcolor="#00AEEF">
				<th>Index</th>
				<th>Name</th>
				<th>Description</th>
				<th>Domain Index</th>
				<th>Domain Name</th>
				<th>Aux0</th>
				<th>Temperature</th>
				<th>Aux1</th>
				<th>Hysteresis</th>
				<th style="border-left:thick solid">CR3</th>
				<th>HOT</th>
				<th>CRT</th>
				<th style="border-left:thick solid">PSV</th>
				<th>NTT</th>
				<th style="border-left:thick solid">AC0</th>
				<th>AC1</th>
				<th>AC2</th>
				<th>AC3</th>
				<th>AC4</th>
				<th>AC5</th>
				<th>AC6</th>
				<th>AC7</th>
				<th>AC8</th>
				<th style="border-right:thick solid">AC9</th>
			</tr>
			<xsl:for-each select="participants/participant">
				<xsl:for-each select="domains/domain">
					<tr>
						<xsl:choose>
							<xsl:when test="position()=1">
								<td align='right'>
									<xsl:value-of select="../../index" />
								</td>
								<td>
									<xsl:value-of select="../../participant_properties/name" />
								</td>

								<xsl:choose>
									<xsl:when test="domain_controls/active_control/active_control_status">
										<td>
											<xsl:value-of select="../../participant_properties/description" />&#160;
											(<xsl:value-of select="domain_controls/active_control/active_control_status/current_control_id" />)
										</td>
									</xsl:when>
									<xsl:otherwise>
										<td>
											<xsl:value-of select="../../participant_properties/description" />
										</td>
									</xsl:otherwise>
								</xsl:choose>

							</xsl:when>
							<xsl:otherwise>
								<td colspan="3" bgcolor="#FFFFFF"></td>
							</xsl:otherwise>
						</xsl:choose>

						<td align='right'>
							<xsl:value-of select="index" />
						</td>
						<td>
							<xsl:value-of select="name" />
						</td>

						<xsl:choose>
							<xsl:when test="domain_controls/temperature_control/temperature_thresholds">
								<td align='right'>
									<xsl:value-of select="domain_controls/temperature_control/temperature_thresholds/aux0" />
								</td>
							</xsl:when>
							<xsl:otherwise>
								<td/>
							</xsl:otherwise>
						</xsl:choose>

						<td align='right'>
							<xsl:value-of select="domain_controls/temperature_control/temperature_status/temperature_status" />
						</td>

						<xsl:choose>
							<xsl:when test="domain_controls/temperature_control/temperature_thresholds">
								<td align='right'>
									<xsl:value-of select="domain_controls/temperature_control/temperature_thresholds/aux1" />
								</td>
								<td align='right'>
									<xsl:value-of select="domain_controls/temperature_control/temperature_thresholds/hysteresis" />
								</td>
							</xsl:when>
							<xsl:otherwise>
								<td/>
								<td/>
							</xsl:otherwise>
						</xsl:choose>

						<xsl:choose>
							<xsl:when test="position()=1">
								<td align='right' style="border-left:thick solid">
									<xsl:value-of select="../../specific_info/wrm" />
								</td>
								<td align='right'>
									<xsl:value-of select="../../specific_info/hot" />
								</td>
								<td align='right'>
									<xsl:value-of select="../../specific_info/crt" />
								</td>
								<td align='right' style="border-left:thick solid">
									<xsl:value-of select="../../specific_info/psv" />
								</td>
								<td align='right'>
									<xsl:value-of select="../../specific_info/ntt" />
								</td>
								<td align='right' style="border-left:thick solid">
									<xsl:value-of select="../../specific_info/ac0" />
								</td>
								<td align='right'>
									<xsl:value-of select="../../specific_info/ac1" />
								</td>
								<td align='right'>
									<xsl:value-of select="../../specific_info/ac2" />
								</td>
								<td align='right'>
									<xsl:value-of select="../../specific_info/ac3" />
								</td>
								<td align='right'>
									<xsl:value-of select="../../specific_info/ac4" />
								</td>
								<td align='right'>
									<xsl:value-of select="../../specific_info/ac5" />
								</td>
								<td align='right'>
									<xsl:value-of select="../../specific_info/ac6" />
								</td>
								<td align='right'>
									<xsl:value-of select="../../specific_info/ac7" />
								</td>
								<td align='right'>
									<xsl:value-of select="../../specific_info/ac8" />
								</td>
								<td align='right' style="border-right:thick solid">
									<xsl:value-of select="../../specific_info/ac9" />
								</td>
							</xsl:when>
							<xsl:otherwise>
								<td style="border-left:thick solid"/>
								<td/>
								<td/>
								<td style="border-left:thick solid"/>
								<td/>
								<td style="border-left:thick solid"/>
								<td/>
								<td/>
								<td/>
								<td/>
								<td/>
								<td/>
								<td/>
								<td/>
								<td style="border-right:thick solid"/>
							</xsl:otherwise>
						</xsl:choose>

					</tr>
				</xsl:for-each>
			</xsl:for-each>
		</table>
	</xsl:template>
</xsl:stylesheet>
<!-- end xsl -->

<!-- begin xsl -->
<?xml version="1.0" encoding="ISO-8859-1"?>
<!-- format_id=10-E0-F6-61-4B-7D-F7-40-AE-90-CF-DA-99-0F-F9-1A -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/policy_manager_event_status">
		<table id="monitor-manager-event-status-table" border="1">
			<tr bgcolor="#00AEEF" colspan="{count(policy_event_status)+1}">
				<th colspan="{count(policy_event_status)+1}">Registered Events</th>
			</tr>
			<tr id="monitor-manager-event-status-table-header-row" bgcolor="#00AEEF">
				<th>Event Name</th>
				<xsl:for-each select="policy_event_status">
					<th>
						<xsl:value-of select="policy_name" />
					</th>
				</xsl:for-each>
			</tr>
			<xsl:for-each select="events/event">
				<xsl:variable name="alt_row_color">
					<xsl:choose>
						<xsl:when test="position() mod 2 = 0">#EBEDEF</xsl:when>
						<xsl:otherwise>#FFFFFF</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<tr bgcolor="{$alt_row_color}">
					<td align='left'>
						<xsl:value-of select="event_name" />
					</td>
					<xsl:variable name="name">
						<xsl:value-of select="event_name"/>
					</xsl:variable>
					<xsl:for-each select="../../policy_event_status">
						<xsl:for-each select="event_values/event">
							<xsl:choose>
								<xsl:when test="event_name=$name">
									<xsl:choose>
										<xsl:when test="event_status='true'">
											<td bgcolor="#CCFFCC" align='center'>yes</td>
										</xsl:when>
										<xsl:otherwise>
											<td align='center'>no</td>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:when>
							</xsl:choose>
						</xsl:for-each>
					</xsl:for-each>
				</tr>
			</xsl:for-each>
		</table>
	</xsl:template>
</xsl:stylesheet>
<!-- end xsl -->

<!-- begin xsl -->
<?xml version="1.0" encoding="ISO-8859-1"?>
<!-- format_id=AC-0A-0E-91-09-A8-69-4E-87-5F-E9-49-F7-97-53-A0 -->
<!-- Active Control Arbitrator-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/arbitrator_status">
		<xsl:variable name="domains">
			<xsl:value-of select="number_of_domains"/>
		</xsl:variable>

		<table border="1" id="monitor-active-control-capabilities-arbitrator-table">
			<tr bgcolor="#00AEEF" colspan="{$domains+1}">
				<th colspan="{$domains+1}">Active Control Capabilitites Arbitrator</th>
			</tr>
			<tr bgcolor="#00AEEF" colspan="{$domains+1}">
				<th colspan="{$domains+1}">Lock Requests</th>
			</tr>
			<tr id="monitor-active-control-capabilities-arbitrator-table-lock-requests-header-row" bgcolor="#00AEEF">
				<th>Policy Name</th>
				<xsl:for-each select="policy">
					<xsl:if test="position()=1">
						<xsl:for-each select="participant_status">
							<xsl:variable name="participant">
								<xsl:value-of select="participant_name"/>
							</xsl:variable>
							<xsl:for-each select="arbitrator_domain_status">
								<th>
									<xsl:value-of select="concat($participant, ' (', domain_name, ')')"/>
								</th>
							</xsl:for-each>
						</xsl:for-each>
					</xsl:if>
				</xsl:for-each>
			</tr>
			<xsl:for-each select="policy">
				<xsl:variable name="alt_row_color">
					<xsl:choose>
						<xsl:when test="position() mod 2 = 0">#EBEDEF</xsl:when>
						<xsl:otherwise>#FFFFFF</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<tr bgcolor="{$alt_row_color}">
					<td align='left'>
						<xsl:value-of select="policy_name"/>
					</td>
					<xsl:for-each select="participant_status/arbitrator_domain_status/domain_status/domain_controls_arbitrator">
						<xsl:for-each select="active_control_capabilities_arbitrator_status">
							<xsl:choose>
								<xsl:when test="requested_lock!='false'">
									<td bgcolor="#CCFFCC" align='center'>LOCKED</td>
								</xsl:when>
								<xsl:otherwise>
									<td align='center'>-</td>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:for-each>
					</xsl:for-each>
				</tr>
			</xsl:for-each>
			<tr bgcolor="#FCDC3B" colspan="{$domains+1}">
				<th colspan="{$domains+1}"> **Narrowest MIN-MAX range wins** </th>
			</tr>
			<tr bgcolor="#00AEEF" colspan="{$domains+1}">
				<th colspan="{$domains+1}">[MIN - MAX] Requests</th>
			</tr>
			<tr id="monitor-active-control-capabilities-arbitrator-table-header-row" bgcolor="#00AEEF">
				<th>Policy Name</th>
				<xsl:for-each select="policy">
					<xsl:if test="position()=1">
						<xsl:for-each select="participant_status">
							<xsl:variable name="participant">
								<xsl:value-of select="participant_name"/>
							</xsl:variable>
							<xsl:for-each select="arbitrator_domain_status">
								<th>
									<xsl:value-of select="concat($participant, ' (', domain_name, ')')"/>
								</th>
							</xsl:for-each>
						</xsl:for-each>
					</xsl:if>
				</xsl:for-each>
			</tr>
			<xsl:for-each select="policy">
				<xsl:variable name="alt_row_color">
					<xsl:choose>
						<xsl:when test="position() mod 2 = 0">#EBEDEF</xsl:when>
						<xsl:otherwise>#FFFFFF</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<tr bgcolor="{$alt_row_color}">
					<td align='left'>
						<xsl:value-of select="policy_name"/>
					</td>
					<xsl:for-each select="participant_status/arbitrator_domain_status/domain_status/domain_controls_arbitrator">
						<xsl:for-each select="active_control_capabilities_arbitrator_status/active_control_caps_request">
							<xsl:choose>
								<xsl:when test="max_fan_speed!='X' or min_fan_speed!='X'">
									<td bgcolor="#CCFFCC" align='center'>
										<xsl:value-of select="min_fan_speed"/> - <xsl:value-of select="max_fan_speed"/>
									</td>
								</xsl:when>
								<xsl:otherwise>
									<xsl:choose>
										<xsl:when test="max_fan_speed='X' and min_fan_speed='X'">
											<td align='center'>-</td>
										</xsl:when>
										<xsl:otherwise>
											<td align='center'>
												<xsl:value-of select="min_fan_speed"/> - <xsl:value-of select="max_fan_speed"/>
											</td>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:for-each>
					</xsl:for-each>
				</tr>
			</xsl:for-each>
		</table>

		<br></br>
		<br></br>
		
		<table border="1" id="monitor-active-control-arbitrator-table">
			<tr bgcolor="#00AEEF" colspan="{$domains+1}">
				<th colspan="{$domains+1}">Active Control Arbitrator</th>
			</tr>
			<tr bgcolor="#FCDC3B" colspan="{$domains+1}">
				<th colspan="{$domains+1}"> **Highest percentage fan speed wins** </th>
			</tr>
			<tr bgcolor="#00AEEF" colspan="{$domains+1}">
				<th colspan="{$domains+1}">Fan Speed Percentage Requests</th>
			</tr>
			<tr id="monitor-active-control-arbitrator-table-header-row" bgcolor="#00AEEF">
				<th>Policy Name</th>
				<xsl:for-each select="policy">
					<xsl:if test="position()=1">
						<xsl:for-each select="participant_status">
							<xsl:variable name="participant">
								<xsl:value-of select="participant_name"/>
							</xsl:variable>
							<xsl:for-each select="arbitrator_domain_status">
								<th>
									<xsl:value-of select="concat($participant, ' (', domain_name, ')')"/>
								</th>
							</xsl:for-each>
						</xsl:for-each>
					</xsl:if>
				</xsl:for-each>
			</tr>
			<xsl:for-each select="policy">
				<xsl:variable name="alt_row_color">
					<xsl:choose>
						<xsl:when test="position() mod 2 = 0">#EBEDEF</xsl:when>
						<xsl:otherwise>#FFFFFF</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<tr bgcolor="{$alt_row_color}">
					<td align='left'>
						<xsl:value-of select="policy_name"/>
					</td>
					<xsl:for-each select="participant_status/arbitrator_domain_status/domain_status/domain_controls_arbitrator">
						<xsl:for-each select="active_control_arbitrator_status">
							<xsl:choose>
								<xsl:when test="fan_speed_percentage!='X'">
									<td bgcolor="#CCFFCC" align='center'>
										<xsl:value-of select="fan_speed_percentage"/>%
									</td>
								</xsl:when>
								<xsl:otherwise>
									<td align='center'>-</td>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:for-each>
					</xsl:for-each>
				</tr>
			</xsl:for-each>
		</table>
	</xsl:template>
</xsl:stylesheet>
<!-- end xsl -->

<!-- begin xsl -->
<?xml version="1.0" encoding="ISO-8859-1"?>
<!-- format_id=B7-7F-DD-EB-DA-0C-DA-4B-A0-6C-9B-C3-75-CD-C7-E3 -->
<!-- Core Control Arbitrator-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/arbitrator_status">
		<xsl:variable name="domains">
			<xsl:value-of select="number_of_domains"/>
		</xsl:variable>

		<table border="1" id="monitor-core-control-arbitrator-table">
			<tr bgcolor="#00AEEF" colspan="{$domains+1}">
				<th colspan="{$domains+1}">Core Control Arbitrator</th>
			</tr>
			<tr bgcolor="#FCDC3B" colspan="{$domains+1}">
				<th colspan="{$domains+1}"> **Lowest core count wins** </th>
			</tr>
			<tr bgcolor="#00AEEF" colspan="{$domains+1}">
				<th colspan="{$domains+1}">Active Core Count Requests</th>
			</tr>
			<tr id="monitor-core-control-arbitrator-table-header-row" bgcolor="#00AEEF">
				<th>Policy Name</th>
				<xsl:for-each select="policy">
					<xsl:if test="position()=1">
						<xsl:for-each select="participant_status">
							<xsl:variable name="participant">
								<xsl:value-of select="participant_name"/>
							</xsl:variable>
							<xsl:for-each select="arbitrator_domain_status">
								<th>
									<xsl:value-of select="concat($participant, ' (', domain_name, ')')"/>
								</th>
							</xsl:for-each>
						</xsl:for-each>
					</xsl:if>
				</xsl:for-each>
			</tr>
			<xsl:for-each select="policy">
				<xsl:variable name="alt_row_color">
					<xsl:choose>
						<xsl:when test="position() mod 2 = 0">#EBEDEF</xsl:when>
						<xsl:otherwise>#FFFFFF</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<tr bgcolor="{$alt_row_color}">
					<td align='left'>
						<xsl:value-of select="policy_name"/>
					</td>
					<xsl:for-each select="participant_status/arbitrator_domain_status/arbitrators_status">
						<xsl:for-each select="core_control_arbitrator_status">
							<xsl:choose>
								<xsl:when test="active_core_count!='X'">
									<td bgcolor="#CCFFCC" align='center'>
										<xsl:value-of select="active_core_count"/>
									</td>
								</xsl:when>
								<xsl:otherwise>
									<td align='center'>-</td>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:for-each>
					</xsl:for-each>
				</tr>
			</xsl:for-each>
		</table>
	</xsl:template>
</xsl:stylesheet>
<!-- end xsl -->

<!-- begin xsl -->
<?xml version="1.0" encoding="ISO-8859-1"?>
<!-- format_id=BD-18-39-7E-40-94-3E-4D-95-15-9E-5F-EF-FB-CD-3F -->
<!-- Display Control Arbitrator-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/arbitrator_status">
		<xsl:variable name="domains">
			<xsl:value-of select="number_of_domains"/>
		</xsl:variable>

		<table border="1" id="monitor-display-control-capabilities-arbitrator-table">
			<tr bgcolor="#00AEEF" colspan="{$domains+1}">
				<th colspan="{$domains+1}">Display Control Capabilitites Arbitrator</th>
			</tr>
			<tr bgcolor="#00AEEF" colspan="{$domains+1}">
				<th colspan="{$domains+1}">Lock Requests</th>
			</tr>
			<tr id="monitor-display-control-capabilities-arbitrator-table-lock-requests-header-row" bgcolor="#00AEEF">
				<th>Policy Name</th>
				<xsl:for-each select="policy">
					<xsl:if test="position()=1">
						<xsl:for-each select="participant_status">
							<xsl:variable name="participant">
								<xsl:value-of select="participant_name"/>
							</xsl:variable>
							<xsl:for-each select="arbitrator_domain_status">
								<th>
									<xsl:value-of select="concat($participant, ' (', domain_name, ')')"/>
								</th>
							</xsl:for-each>
						</xsl:for-each>
					</xsl:if>
				</xsl:for-each>
			</tr>
			<xsl:for-each select="policy">
				<xsl:variable name="alt_row_color">
					<xsl:choose>
						<xsl:when test="position() mod 2 = 0">#EBEDEF</xsl:when>
						<xsl:otherwise>#FFFFFF</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<tr bgcolor="{$alt_row_color}">
					<td align='left'>
						<xsl:value-of select="policy_name"/>
					</td>
					<xsl:for-each select="participant_status/arbitrator_domain_status/arbitrators_status">
						<xsl:for-each select="display_control_capabilities_arbitrator_status">
							<xsl:choose>
								<xsl:when test="requested_lock!='false'">
									<td bgcolor="#CCFFCC" align='center'>LOCKED</td>
								</xsl:when>
								<xsl:otherwise>
									<td align='center'>-</td>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:for-each>
					</xsl:for-each>
				</tr>
			</xsl:for-each>
			<tr bgcolor="#FCDC3B" colspan="{$domains+1}">
				<th colspan="{$domains+1}"> **Narrowest MIN-MAX range wins** </th>
			</tr>
			<tr bgcolor="#00AEEF" colspan="{$domains+1}">
				<th colspan="{$domains+1}">[MIN - MAX] Requests</th>
			</tr>
			<tr id="monitor-display-control-capabilities-arbitrator-table-header-row" bgcolor="#00AEEF">
				<th>Policy Name</th>
				<xsl:for-each select="policy">
					<xsl:if test="position()=1">
						<xsl:for-each select="participant_status">
							<xsl:variable name="participant">
								<xsl:value-of select="participant_name"/>
							</xsl:variable>
							<xsl:for-each select="arbitrator_domain_status">
								<th>
									<xsl:value-of select="concat($participant, ' (', domain_name, ')')"/>
								</th>
							</xsl:for-each>
						</xsl:for-each>
					</xsl:if>
				</xsl:for-each>
			</tr>
			<xsl:for-each select="policy">
				<xsl:variable name="alt_row_color">
					<xsl:choose>
						<xsl:when test="position() mod 2 = 0">#EBEDEF</xsl:when>
						<xsl:otherwise>#FFFFFF</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<tr bgcolor="{$alt_row_color}">
					<td align='left'>
						<xsl:value-of select="policy_name"/>
					</td>
					<xsl:for-each select="participant_status/arbitrator_domain_status/arbitrators_status">
						<xsl:for-each select="display_control_capabilities_arbitrator_status/display_control_dynamic_caps">
							<xsl:choose>
								<xsl:when test="upper_limit_index!='X' or lower_limit_index!='X'">
									<td bgcolor="#CCFFCC" align='center'>
										<xsl:value-of select="lower_limit_index"/> - <xsl:value-of select="upper_limit_index"/>
									</td>
								</xsl:when>
								<xsl:otherwise>
									<xsl:choose>
										<xsl:when test="upper_limit_index='X' and lower_limit_index='X'">
											<td align='center'>-</td>
										</xsl:when>
										<xsl:otherwise>
											<td align='center'>
												<xsl:value-of select="lower_limit_index"/> - <xsl:value-of select="upper_limit_index"/>
											</td>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:for-each>
					</xsl:for-each>
				</tr>
			</xsl:for-each>
		</table>

		<br></br>
		<br></br>

		<table border="1" id="monitor-display-control-arbitrator-table">
			<tr bgcolor="#00AEEF" colspan="{$domains+1}">
				<th colspan="{$domains+1}">Display Control Arbitrator</th>
			</tr>
			<tr bgcolor="#FCDC3B" colspan="{$domains+1}">
				<th colspan="{$domains+1}"> **Highest display index wins** </th>
			</tr>
			<tr bgcolor="#00AEEF" colspan="{$domains+1}">
				<th colspan="{$domains+1}">Display Index Requests</th>
			</tr>
			<tr id="monitor-display-control-arbitrator-table-header-row" bgcolor="#00AEEF">
				<th>Policy Name</th>
				<xsl:for-each select="policy">
					<xsl:if test="position()=1">
						<xsl:for-each select="participant_status">
							<xsl:variable name="participant">
								<xsl:value-of select="participant_name"/>
							</xsl:variable>
							<xsl:for-each select="arbitrator_domain_status">
								<th>
									<xsl:value-of select="concat($participant, ' (', domain_name, ')')"/>
								</th>
							</xsl:for-each>
						</xsl:for-each>
					</xsl:if>
				</xsl:for-each>
			</tr>
			<xsl:for-each select="policy">
				<xsl:variable name="alt_row_color">
					<xsl:choose>
						<xsl:when test="position() mod 2 = 0">#EBEDEF</xsl:when>
						<xsl:otherwise>#FFFFFF</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<tr bgcolor="{$alt_row_color}">
					<td align='left'>
						<xsl:value-of select="policy_name"/>power_s
					</td>
					<xsl:for-each select="participant_status/arbitrator_domain_status/arbitrators_status">
						<xsl:for-each select="display_control_arbitrator_status">
							<xsl:choose>
								<xsl:when test="display_index!='X'">
									<td bgcolor="#CCFFCC" align='center'>
										<xsl:value-of select="display_index"/>
									</td>
								</xsl:when>
								<xsl:otherwise>
									<td align='center'>-</td>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:for-each>
					</xsl:for-each>
				</tr>
			</xsl:for-each>
		</table>
	</xsl:template>
</xsl:stylesheet>
<!-- end xsl -->

<!-- begin xsl -->
<?xml version="1.0" encoding="ISO-8859-1"?>
<!-- format_id=45-48-AA-D1-75-BF-24-47-9A-5D-31-AD-EA-4D-7C-82 -->
<!-- Peak Power Control Arbitrator-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/arbitrator_status">
		<xsl:variable name="domains">
			<xsl:value-of select="number_of_domains"/>
		</xsl:variable>

		<table border="1" id="monitor-peak-power-control-arbitrator-table">
			<tr bgcolor="#00AEEF" colspan="{$domains+1}">
				<th colspan="{$domains+1}">Peak Power Control Arbitrator</th>
			</tr>
			<tr bgcolor="#FCDC3B" colspan="{$domains+1}">
				<th colspan="{$domains+1}"> **Lowest request per type wins** </th>
			</tr>
			<tr bgcolor="#00AEEF" colspan="{$domains+1}">
				<th colspan="{$domains+1}">[PL4 AC Power - PL4 DC Power] Requests</th>
			</tr>
			<tr id="monitor-peak-power-control-arbitrator-table-header-row" bgcolor="#00AEEF">
				<th>Policy Name</th>
				<xsl:for-each select="policy">
					<xsl:if test="position()=1">
						<xsl:for-each select="participant_status">
							<xsl:variable name="participant">
								<xsl:value-of select="participant_name"/>
							</xsl:variable>
							<xsl:for-each select="arbitrator_domain_status">
								<th>
									<xsl:value-of select="concat($participant, ' (', domain_name, ')')"/>
								</th>
							</xsl:for-each>
						</xsl:for-each>
					</xsl:if>
				</xsl:for-each>
			</tr>
			<xsl:for-each select="policy">
				<xsl:variable name="alt_row_color">
					<xsl:choose>
						<xsl:when test="position() mod 2 = 0">#EBEDEF</xsl:when>
						<xsl:otherwise>#FFFFFF</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<tr bgcolor="{$alt_row_color}">
					<td align='left'>
						<xsl:value-of select="policy_name"/>
					</td>
					<xsl:for-each select="participant_status/arbitrator_domain_status/arbitrators_status">
						<xsl:for-each select="peak_power_control_arbitrator_status">
							<xsl:choose>
								<xsl:when test="peak_power_AC_Peak_Power!='X' or peak_power_DC_Peak_Power!='X'">
									<td bgcolor="#CCFFCC" align='center'>
										<xsl:value-of select="peak_power_AC_Peak_Power"/> - <xsl:value-of select="peak_power_DC_Peak_Power"/>
									</td>
								</xsl:when>
								<xsl:otherwise>
									<td align='center'>
										<xsl:value-of select="peak_power_AC_Peak_Power"/> - <xsl:value-of select="peak_power_DC_Peak_Power"/>
									</td>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:for-each>
					</xsl:for-each>
				</tr>
			</xsl:for-each>
		</table>
	</xsl:template>
</xsl:stylesheet>
<!-- end xsl -->

<!-- begin xsl -->
<?xml version="1.0" encoding="ISO-8859-1"?>
<!-- format_id=AC-27-24-21-6E-D8-A2-49-88-60-94-13-C9-17-D3-19 -->
<!-- Performance Control Arbitrator-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/arbitrator_status">
		<xsl:variable name="domains">
			<xsl:value-of select="number_of_domains"/>
		</xsl:variable>

		<table border="1" id="monitor-performance-control-capabilities-arbitrator-table">
			<tr bgcolor="#00AEEF" colspan="{$domains+1}">
				<th colspan="{$domains+1}">Performance Control Capabilitites Arbitrator</th>
			</tr>
			<tr bgcolor="#00AEEF" colspan="{$domains+1}">
				<th colspan="{$domains+1}">Lock Requests</th>
			</tr>
			<tr id="monitor-performance-control-capabilities-arbitrator-table-lock-requests-header-row" bgcolor="#00AEEF">
				<th>Policy Name</th>
				<xsl:for-each select="policy">
					<xsl:if test="position()=1">
						<xsl:for-each select="participant_status">
							<xsl:variable name="participant">
								<xsl:value-of select="participant_name"/>
							</xsl:variable>
							<xsl:for-each select="arbitrator_domain_status">
								<th>
									<xsl:value-of select="concat($participant, ' (', domain_name, ')')"/>
								</th>
							</xsl:for-each>
						</xsl:for-each>
					</xsl:if>
				</xsl:for-each>
			</tr>
			<xsl:for-each select="policy">
				<xsl:variable name="alt_row_color">
					<xsl:choose>
						<xsl:when test="position() mod 2 = 0">#EBEDEF</xsl:when>
						<xsl:otherwise>#FFFFFF</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<tr bgcolor="{$alt_row_color}">
					<td align='left'>
						<xsl:value-of select="policy_name"/>
					</td>
					<xsl:for-each select="participant_status/arbitrator_domain_status/arbitrators_status">
						<xsl:for-each select="performance_control_capabilities_arbitrator_status">
							<xsl:choose>
								<xsl:when test="requested_lock!='false'">
									<td bgcolor="#CCFFCC" align='center'>LOCKED</td>
								</xsl:when>
								<xsl:otherwise>
									<td align='center'>-</td>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:for-each>
					</xsl:for-each>
				</tr>
			</xsl:for-each>
			<tr bgcolor="#FCDC3B" colspan="{$domains+1}">
				<th colspan="{$domains+1}"> **Narrowest MIN-MAX range wins** </th>
			</tr>
			<tr bgcolor="#00AEEF" colspan="{$domains+1}">
				<th colspan="{$domains+1}">[MIN - MAX] Requests</th>
			</tr>
			<tr id="monitor-performance-control-capabilities-arbitrator-table-header-row" bgcolor="#00AEEF">
				<th>Policy Name</th>
				<xsl:for-each select="policy">
					<xsl:if test="position()=1">
						<xsl:for-each select="participant_status">
							<xsl:variable name="participant">
								<xsl:value-of select="participant_name"/>
							</xsl:variable>
							<xsl:for-each select="arbitrator_domain_status">
								<th>
									<xsl:value-of select="concat($participant, ' (', domain_name, ')')"/>
								</th>
							</xsl:for-each>
						</xsl:for-each>
					</xsl:if>
				</xsl:for-each>
			</tr>
			<xsl:for-each select="policy">
				<xsl:variable name="alt_row_color">
					<xsl:choose>
						<xsl:when test="position() mod 2 = 0">#EBEDEF</xsl:when>
						<xsl:otherwise>#FFFFFF</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<tr bgcolor="{$alt_row_color}">
					<td align='left'>
						<xsl:value-of select="policy_name"/>
					</td>
					<xsl:for-each select="participant_status/arbitrator_domain_status/arbitrators_status">
						<xsl:for-each select="performance_control_capabilities_arbitrator_status/performance_control_dynamic_caps">
							<xsl:choose>
								<xsl:when test="upper_limit_index!='X' or lower_limit_index!='X'">
									<td bgcolor="#CCFFCC" align='center'>
										<xsl:value-of select="lower_limit_index"/> - <xsl:value-of select="upper_limit_index"/>
									</td>
								</xsl:when>
								<xsl:otherwise>
									<xsl:choose>
										<xsl:when test="upper_limit_index='X' and lower_limit_index='X'">
											<td align='center'>-</td>
										</xsl:when>
										<xsl:otherwise>
											<td align='center'>
												<xsl:value-of select="lower_limit_index"/> - <xsl:value-of select="upper_limit_index"/>
											</td>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:for-each>
					</xsl:for-each>
				</tr>
			</xsl:for-each>
		</table>

		<br></br>
		<br></br>

		<table border="1" id="monitor-performance-control-arbitrator-table">
			<tr bgcolor="#00AEEF" colspan="{$domains+1}">
				<th colspan="{$domains+1}">Performance Control Arbitrator</th>
			</tr>
			<tr bgcolor="#FCDC3B" colspan="{$domains+1}">
				<th colspan="{$domains+1}"> **Highest performance index wins** </th>
			</tr>
			<tr bgcolor="#00AEEF" colspan="{$domains+1}">
				<th colspan="{$domains+1}">Performance Index Requests</th>
			</tr>
			<tr id="monitor-performance-control-arbitrator-table-header-row" bgcolor="#00AEEF">
				<th>Policy Name</th>
				<xsl:for-each select="policy">
					<xsl:if test="position()=1">
						<xsl:for-each select="participant_status">
							<xsl:variable name="participant">
								<xsl:value-of select="participant_name"/>
							</xsl:variable>
							<xsl:for-each select="arbitrator_domain_status">
								<th>
									<xsl:value-of select="concat($participant, ' (', domain_name, ')')"/>
								</th>
							</xsl:for-each>
						</xsl:for-each>
					</xsl:if>
				</xsl:for-each>
			</tr>
			<xsl:for-each select="policy">
				<xsl:variable name="alt_row_color">
					<xsl:choose>
						<xsl:when test="position() mod 2 = 0">#EBEDEF</xsl:when>
						<xsl:otherwise>#FFFFFF</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<tr bgcolor="{$alt_row_color}">
					<td align='left'>
						<xsl:value-of select="policy_name"/>
					</td>
					<xsl:for-each select="participant_status/arbitrator_domain_status/arbitrators_status">
						<xsl:for-each select="performance_control_arbitrator_status">
							<xsl:choose>
								<xsl:when test="performance_index!='X'">
									<td bgcolor="#CCFFCC" align='center'>
										<xsl:value-of select="performance_index"/>
									</td>
								</xsl:when>
								<xsl:otherwise>
									<td align='center'>-</td>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:for-each>
					</xsl:for-each>
				</tr>
			</xsl:for-each>
		</table>
	</xsl:template>
</xsl:stylesheet>
<!-- end xsl -->

<!-- begin xsl -->
<?xml version="1.0" encoding="ISO-8859-1"?>
<!-- format_id=FF-5A-B4-72-1B-29-08-4D-8D-54-33-58-B7-C8-82-1D -->
<!-- Power Control Arbitrator-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/arbitrator_status">
		<xsl:variable name="domains">
			<xsl:value-of select="number_of_domains"/>
		</xsl:variable>

		<table border="1" id="monitor-power-control-capabilities-arbitrator-table">
			<tr bgcolor="#00AEEF" colspan="{$domains+1}">
				<th colspan="{$domains+1}">Power Control Capabilities Arbitrator</th>
			</tr>
			<tr bgcolor="#00AEEF" colspan="{$domains+1}">
				<th colspan="{$domains+1}">Lock Requests</th>
			</tr>
			<tr id="monitor-power-control-capabilities-arbitrator-table-lock-requests-header-row" bgcolor="#00AEEF">
				<th>Policy Name</th>
				<xsl:for-each select="policy">
					<xsl:if test="position()=1">
						<xsl:for-each select="participant_status">
							<xsl:variable name="participant">
								<xsl:value-of select="participant_name"/>
							</xsl:variable>
							<xsl:for-each select="arbitrator_domain_status">
								<th>
									<xsl:value-of select="concat($participant, ' (', domain_name, ')')"/>
								</th>
							</xsl:for-each>
						</xsl:for-each>
					</xsl:if>
				</xsl:for-each>
			</tr>
			<xsl:for-each select="policy">
				<xsl:variable name="alt_row_color">
					<xsl:choose>
						<xsl:when test="position() mod 2 = 0">#EBEDEF</xsl:when>
						<xsl:otherwise>#FFFFFF</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<tr bgcolor="{$alt_row_color}">
					<td align='left'>
						<xsl:value-of select="policy_name"/>
					</td>
					<xsl:for-each select="participant_status/arbitrator_domain_status/arbitrators_status">
						<xsl:for-each select="power_control_capabilities_arbitrator_status">
							<xsl:choose>
								<xsl:when test="requested_lock!='false'">
									<td bgcolor="#CCFFCC" align='center'>LOCKED</td>
								</xsl:when>
								<xsl:otherwise>
									<td align='center'>-</td>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:for-each>
					</xsl:for-each>
				</tr>
			</xsl:for-each>
			<tr bgcolor="#FCDC3B" colspan="{$domains+1}">
				<th colspan="{$domains+1}"> **Widest MIN-MAX ranges win** </th>
			</tr>
			<tr bgcolor="#00AEEF" colspan="{$domains+1}">
				<th colspan="{$domains+1}">[PL1 PowerMin - PL1 PowerMax - PL1 PowerStep - PL1 TimeWindowMin - PL1 TimeWindowMax] Requests</th>
			</tr>
			<tr id="monitor-power-control-capabilities-arbitrator-table-pl1-requests-header-row" bgcolor="#00AEEF">
				<th>Policy Name</th>
				<xsl:for-each select="policy">
					<xsl:if test="position()=1">
						<xsl:for-each select="participant_status">
							<xsl:variable name="participant">
								<xsl:value-of select="participant_name"/>
							</xsl:variable>
							<xsl:for-each select="arbitrator_domain_status">
								<th>
									<xsl:value-of select="concat($participant, ' (', domain_name, ')')"/>
								</th>
							</xsl:for-each>
						</xsl:for-each>
					</xsl:if>
				</xsl:for-each>
			</tr>
			<xsl:for-each select="policy">
				<xsl:variable name="alt_row_color">
					<xsl:choose>
						<xsl:when test="position() mod 2 = 0">#EBEDEF</xsl:when>
						<xsl:otherwise>#FFFFFF</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<tr bgcolor="{$alt_row_color}">
					<td align='left'>
						<xsl:value-of select="policy_name"/>
					</td>
					<xsl:for-each select="participant_status/arbitrator_domain_status/arbitrators_status">
						<xsl:choose>
							<xsl:when test="power_control_capabilities_arbitrator_status/power_control_dynamic_caps">
								<xsl:for-each select="power_control_capabilities_arbitrator_status/power_control_dynamic_caps">
									<xsl:if test="control_type='PL1'">
										<xsl:choose>
											<xsl:when test="max_power_limit!='X' or min_power_limit!='X' or power_step_size!='X' or max_time_window!='X' or min_time_window!='X'">
												<td bgcolor="#CCFFCC" align='center'>
													<xsl:value-of select="min_power_limit"/> - <xsl:value-of select="max_power_limit"/> - <xsl:value-of select="power_step_size"/> - <xsl:value-of select="min_time_window"/> - <xsl:value-of select="max_time_window"/>
												</td>
											</xsl:when>
											<xsl:otherwise>
												<td align='center'>
													<xsl:value-of select="min_power_limit"/> - <xsl:value-of select="max_power_limit"/> - <xsl:value-of select="power_step_size"/> - <xsl:value-of select="min_time_window"/> - <xsl:value-of select="max_time_window"/>
												</td>
											</xsl:otherwise>
										</xsl:choose>
									</xsl:if>
								</xsl:for-each>
							</xsl:when>
							<xsl:otherwise>
								<td align='center'>-</td>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:for-each>
				</tr>
			</xsl:for-each>
			<tr bgcolor="#00AEEF" colspan="{$domains+1}">
				<th colspan="{$domains+1}">[PL2 PowerMin - PL2 PowerMax - PL2 PowerStep - PL2 TimeWindowMin - PL2 TimeWindowMax] Requests</th>
			</tr>
			<tr id="monitor-power-control-capabilities-arbitrator-table-pl2-requests-header-row" bgcolor="#00AEEF">
				<th>Policy Name</th>
				<xsl:for-each select="policy">
					<xsl:if test="position()=1">
						<xsl:for-each select="participant_status">
							<xsl:variable name="participant">
								<xsl:value-of select="participant_name"/>
							</xsl:variable>
							<xsl:for-each select="arbitrator_domain_status">
								<th>
									<xsl:value-of select="concat($participant, ' (', domain_name, ')')"/>
								</th>
							</xsl:for-each>
						</xsl:for-each>
					</xsl:if>
				</xsl:for-each>
			</tr>
			<xsl:for-each select="policy">
				<xsl:variable name="alt_row_color">
					<xsl:choose>
						<xsl:when test="position() mod 2 = 0">#EBEDEF</xsl:when>
						<xsl:otherwise>#FFFFFF</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<tr bgcolor="{$alt_row_color}">
					<td align='left'>
						<xsl:value-of select="policy_name"/>
					</td>
					<xsl:for-each select="participant_status/arbitrator_domain_status/arbitrators_status">
						<xsl:choose>
							<xsl:when test="power_control_capabilities_arbitrator_status/power_control_dynamic_caps">
								<xsl:for-each select="power_control_capabilities_arbitrator_status/power_control_dynamic_caps">
									<xsl:if test="control_type='PL2'">
										<xsl:choose>
											<xsl:when test="max_power_limit!='X' or min_power_limit!='X' or power_step_size!='X' or max_time_window!='X' or min_time_window!='X'">
												<td bgcolor="#CCFFCC" align='center'>
													<xsl:value-of select="min_power_limit"/> - <xsl:value-of select="max_power_limit"/> - <xsl:value-of select="power_step_size"/> - <xsl:value-of select="min_time_window"/> - <xsl:value-of select="max_time_window"/>
												</td>
											</xsl:when>
											<xsl:otherwise>
												<td align='center'>
													<xsl:value-of select="min_power_limit"/> - <xsl:value-of select="max_power_limit"/> - <xsl:value-of select="power_step_size"/> - <xsl:value-of select="min_time_window"/> - <xsl:value-of select="max_time_window"/>
												</td>
											</xsl:otherwise>
										</xsl:choose>
									</xsl:if>
								</xsl:for-each>
							</xsl:when>
							<xsl:otherwise>
								<td align='center'>-</td>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:for-each>
				</tr>
			</xsl:for-each>
		</table>

		<br></br>
		<br></br>

		<table border="1" id="monitor-power-control-arbitrator-table">
			<tr bgcolor="#00AEEF" colspan="{$domains+1}">
				<th colspan="{$domains+1}">Power Control Arbitrator</th>
			</tr>
			<tr bgcolor="#FCDC3B" colspan="{$domains+1}">
				<th colspan="{$domains+1}"> **Lowest request per type wins** </th>
			</tr>
			<tr bgcolor="#00AEEF" colspan="{$domains+1}">
				<th colspan="{$domains+1}">[PL1 PowerLimit - PL2 PowerLimit - PL3 PowerLimit - PL4 PowerLimit - PL1 TimeWindow - PL3 TimeWindow - PL3 DutyCycle] Requests</th>
			</tr>
			<tr id="monitor-power-control-arbitrator-table-power-limits-header-row" bgcolor="#00AEEF">
				<th>Policy Name</th>
				<xsl:for-each select="policy">
					<xsl:if test="position()=1">
						<xsl:for-each select="participant_status">
							<xsl:variable name="participant">
								<xsl:value-of select="participant_name"/>
							</xsl:variable>
							<xsl:for-each select="arbitrator_domain_status">
								<th>
									<xsl:value-of select="concat($participant, ' (', domain_name, ')')"/>
								</th>
							</xsl:for-each>
						</xsl:for-each>
					</xsl:if>
				</xsl:for-each>
			</tr>
			<xsl:for-each select="policy">
				<xsl:variable name="alt_row_color">
					<xsl:choose>
						<xsl:when test="position() mod 2 = 0">#EBEDEF</xsl:when>
						<xsl:otherwise>#FFFFFF</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<tr bgcolor="{$alt_row_color}">
					<td align='left'>
						<xsl:value-of select="policy_name"/>
					</td>
					<xsl:for-each select="participant_status/arbitrator_domain_status/arbitrators_status">
						<xsl:for-each select="power_control_arbitrator_status">
							<xsl:choose>
								<xsl:when test="power_limit_PL1!='X' or power_limit_PL2!='X' or power_limit_PL3!='X' or power_limit_PL4!='X' or time_window_PL1!='X' or time_window_PL3!='X' or duty_cycle_PL3!='X'">
									<td bgcolor="#CCFFCC" align='center'>
										<xsl:value-of select="power_limit_PL1"/> - <xsl:value-of select="power_limit_PL2"/> - <xsl:value-of select="power_limit_PL3"/> - <xsl:value-of select="power_limit_PL4"/> - <xsl:value-of select="time_window_PL1"/> - <xsl:value-of select="time_window_PL3"/> - <xsl:value-of select="duty_cycle_PL3"/>
									</td>
								</xsl:when>
								<xsl:otherwise>
									<td align='center'>
										<xsl:value-of select="power_limit_PL1"/> - <xsl:value-of select="power_limit_PL2"/> - <xsl:value-of select="power_limit_PL3"/> - <xsl:value-of select="power_limit_PL4"/> - <xsl:value-of select="time_window_PL1"/> - <xsl:value-of select="time_window_PL3"/> - <xsl:value-of select="duty_cycle_PL3"/>
									</td>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:for-each>
					</xsl:for-each>
				</tr>
			</xsl:for-each>
			<tr bgcolor="#FCDC3B" colspan="{$domains+1}">
				<th colspan="{$domains+1}"> **Enabled State(true) wins** </th>
			</tr>
			<tr bgcolor="#00AEEF" colspan="{$domains+1}">
				<th colspan="{$domains+1}">[SoC Power Floor State] Requests</th>
			</tr>
			<tr id="monitor-power-control-arbitrator-table-soc-power-floor-states-header-row" bgcolor="#00AEEF">
				<th>Policy Name</th>
				<xsl:for-each select="policy">
					<xsl:if test="position()=1">
						<xsl:for-each select="participant_status">
							<xsl:variable name="participant">
								<xsl:value-of select="participant_name"/>
							</xsl:variable>
							<xsl:for-each select="arbitrator_domain_status">
								<th>
									<xsl:value-of select="concat($participant, ' (', domain_name, ')')"/>
								</th>
							</xsl:for-each>
						</xsl:for-each>
					</xsl:if>
				</xsl:for-each>
			</tr>
			<xsl:for-each select="policy">
				<xsl:variable name="alt_row_color">
					<xsl:choose>
						<xsl:when test="position() mod 2 = 0">#EBEDEF</xsl:when>
						<xsl:otherwise>#FFFFFF</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<tr bgcolor="{$alt_row_color}">
					<td align='left'>
						<xsl:value-of select="policy_name"/>
					</td>
					<xsl:for-each select="participant_status/arbitrator_domain_status/arbitrators_status">
						<xsl:for-each select="power_control_arbitrator_status">
							<xsl:choose>
								<xsl:when test="soc_power_floor_state='true' or soc_power_floor_state='false'">
									<td bgcolor="#CCFFCC" align='center'>
										<xsl:value-of select="soc_power_floor_state"/>
									</td>
								</xsl:when>
								<xsl:otherwise>
									<td align='center'>-</td>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:for-each>
					</xsl:for-each>
				</tr>
			</xsl:for-each>
		</table>
	</xsl:template>
</xsl:stylesheet>
<!-- end xsl -->

<!-- begin xsl -->
<?xml version="1.0" encoding="ISO-8859-1"?>
<!-- format_id=F3-D5-03-F3-E6-64-93-47-9A-42-4A-79-10-6F-78-D7 -->
<!-- Processor Control Arbitrator-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/arbitrator_status">
		<xsl:variable name="domains">
			<xsl:value-of select="number_of_domains"/>
		</xsl:variable>

		<table border="1" id="monitor-processor-control-arbitrator-table">
			<tr bgcolor="#00AEEF" colspan="{$domains+1}">
				<th colspan="{$domains+1}">Processor Control Arbitrator</th>
			</tr>
			<tr bgcolor="#FCDC3B" colspan="{$domains+1}">
				<th colspan="{$domains+1}"> **Lowest request per control wins** </th>
			</tr>
			<tr bgcolor="#00AEEF" colspan="{$domains+1}">
				<th colspan="{$domains+1}">[TCC offset - UVTH] Requests</th>
			</tr>
			<tr id="monitor-processor-control-arbitrator-table-header-row" bgcolor="#00AEEF">
				<th>Policy Name</th>
				<xsl:for-each select="policy">
					<xsl:if test="position()=1">
						<xsl:for-each select="participant_status">
							<xsl:variable name="participant">
								<xsl:value-of select="participant_name"/>
							</xsl:variable>
							<xsl:for-each select="arbitrator_domain_status">
								<th>
									<xsl:value-of select="concat($participant, ' (', domain_name, ')')"/>
								</th>
							</xsl:for-each>
						</xsl:for-each>
					</xsl:if>
				</xsl:for-each>
			</tr>
			<xsl:for-each select="policy">
				<xsl:variable name="alt_row_color">
					<xsl:choose>
						<xsl:when test="position() mod 2 = 0">#EBEDEF</xsl:when>
						<xsl:otherwise>#FFFFFF</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<tr bgcolor="{$alt_row_color}">
					<td align='left'>
						<xsl:value-of select="policy_name"/>
					</td>
					<xsl:for-each select="participant_status/arbitrator_domain_status/domain_status/domain_controls_arbitrator">
						<xsl:choose>
							<xsl:when test="processor_control_arbitrator_status">
								<xsl:for-each select="processor_control_arbitrator_status">
									<xsl:choose>
										<xsl:when test="tcc_offset!='X' or under_voltage_threshold!='X'">
											<td bgcolor="#CCFFCC" align='center'>
												<xsl:value-of select="tcc_offset"/> - <xsl:value-of select="under_voltage_threshold"/>
											</td>
										</xsl:when>
										<xsl:otherwise>
											<td align='center'>
												<xsl:value-of select="tcc_offset"/> - <xsl:value-of select="under_voltage_threshold"/>
											</td>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:for-each>
							</xsl:when>
							<xsl:otherwise>
								<td align='center'> - </td>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:for-each>
				</tr>
			</xsl:for-each>
		</table>
	</xsl:template>
</xsl:stylesheet>
<!-- end xsl -->

<!-- begin xsl -->
<?xml version="1.0" encoding="ISO-8859-1"?>
<!-- format_id=F0-D0-DC-6D-AE-95-F2-42-B5-48-98-CE-F6-86-52-DE -->
<!-- System Power Control Arbitrator-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/arbitrator_status">
		<xsl:variable name="domains">
			<xsl:value-of select="number_of_domains"/>
		</xsl:variable>

		<table border="1" id="monitor-system-power-control-arbitrator-table">
			<tr bgcolor="#00AEEF" colspan="{$domains+1}">
				<th colspan="{$domains+1}">System Power Control Arbitrator</th>
			</tr>
			<tr bgcolor="#FCDC3B" colspan="{$domains+1}">
				<th colspan="{$domains+1}"> **Lowest request per type wins** </th>
			</tr>
			<tr bgcolor="#00AEEF" colspan="{$domains+1}">
				<th colspan="{$domains+1}">[PsysPL1 PowerLimit - PsysPL2 PowerLimit - PsysPL3 PowerLimit - PsysPL1 TimeWindow - PsysPL3 TimeWindow - PsysPL3 DutyCycle] Requests</th>
			</tr>
			<tr id="monitor-system-power-control-arbitrator-table-header-row" bgcolor="#00AEEF">
				<th>Policy Name</th>
				<xsl:for-each select="policy">
					<xsl:if test="position()=1">
						<xsl:for-each select="participant_status">
							<xsl:variable name="participant">
								<xsl:value-of select="participant_name"/>
							</xsl:variable>
							<xsl:for-each select="arbitrator_domain_status">
								<th>
									<xsl:value-of select="concat($participant, ' (', domain_name, ')')"/>
								</th>
							</xsl:for-each>
						</xsl:for-each>
					</xsl:if>
				</xsl:for-each>
			</tr>
			<xsl:for-each select="policy">
				<xsl:variable name="alt_row_color">
					<xsl:choose>
						<xsl:when test="position() mod 2 = 0">#EBEDEF</xsl:when>
						<xsl:otherwise>#FFFFFF</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<tr bgcolor="{$alt_row_color}">
					<td align='left'>
						<xsl:value-of select="policy_name"/>
					</td>
					<xsl:for-each select="participant_status/arbitrator_domain_status/arbitrators_status">
						<xsl:for-each select="system_power_control_arbitrator_status">
							<xsl:choose>
								<xsl:when test="power_limit_PSys_PL1!='X' or power_limit_PSys_PL2!='X' or power_limit_PSys_PL3!='X' or time_window_PSys_PL1!='X' or time_window_PSys_PL3!='X' or duty_cycle_PSys_PL3!='X'">
									<td bgcolor="#CCFFCC" align='center'>
										<xsl:value-of select="power_limit_PSys_PL1"/> - <xsl:value-of select="power_limit_PSys_PL2"/> - <xsl:value-of select="power_limit_PSys_PL3"/> - <xsl:value-of select="time_window_PSys_PL1"/> - <xsl:value-of select="time_window_PSys_PL3"/> - <xsl:value-of select="duty_cycle_PSys_PL3"/>
									</td>
								</xsl:when>
								<xsl:otherwise>
									<td align='center'>
										<xsl:value-of select="power_limit_PSys_PL1"/> - <xsl:value-of select="power_limit_PSys_PL2"/> - <xsl:value-of select="power_limit_PSys_PL3"/> - <xsl:value-of select="time_window_PSys_PL1"/> - <xsl:value-of select="time_window_PSys_PL3"/> - <xsl:value-of select="duty_cycle_PSys_PL3"/>
									</td>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:for-each>
					</xsl:for-each>
				</tr>
			</xsl:for-each>
		</table>
	</xsl:template>
</xsl:stylesheet>
<!-- end xsl -->

<!-- begin xsl -->
<?xml version="1.0" encoding="ISO-8859-1"?>
<!-- format_id=7B-86-29-A9-09-AE-6E-40-AB-8F-8C-4C-6A-F8-7F-69 -->
<!-- Temperature Control Arbitrator-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/arbitrator_status">
		<xsl:variable name="domains">
			<xsl:value-of select="number_of_domains"/>
		</xsl:variable>

		<table border="1" id="monitor-temperature-thresholds-control-arbitrator-table">
			<tr bgcolor="#00AEEF" colspan="{$domains+1}">
				<th colspan="{$domains+1}">Temperature Thresholds Control Arbitrator</th>
			</tr>
			<tr bgcolor="#FCDC3B" colspan="{$domains+1}">
				<th colspan="{$domains+1}"> **Lowest aux1 and highest aux0 wins** </th>
			</tr>
			<tr bgcolor="#00AEEF" colspan="{$domains+1}">
				<th colspan="{$domains+1}">[Aux0 - Aux1 - Hysteresis] Requests</th>
			</tr>
			<tr id="monitor-temperature-thresholds-control-arbitrator-table-header-row" bgcolor="#00AEEF">
				<th>Policy Name</th>
				<xsl:for-each select="policy">
					<xsl:if test="position()=1">
						<xsl:for-each select="participant_status">
							<xsl:variable name="participant">
								<xsl:value-of select="participant_name"/>
							</xsl:variable>
							<xsl:for-each select="arbitrator_domain_status">
								<th>
									<xsl:value-of select="concat($participant, ' (', domain_name, ')')"/>
								</th>
							</xsl:for-each>
						</xsl:for-each>
					</xsl:if>
				</xsl:for-each>
			</tr>
			<xsl:for-each select="policy">
				<xsl:variable name="alt_row_color">
					<xsl:choose>
						<xsl:when test="position() mod 2 = 0">#EBEDEF</xsl:when>
						<xsl:otherwise>#FFFFFF</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<tr bgcolor="{$alt_row_color}">
					<td align='left'>
						<xsl:value-of select="policy_name"/>
					</td>
					<xsl:for-each select="participant_status/arbitrator_domain_status/domain_status/domain_controls_arbitrator">
						<xsl:choose>
							<xsl:when test="temperature_thresholds_arbitrator_status/temperature_thresholds">
								<xsl:for-each select="temperature_thresholds_arbitrator_status/temperature_thresholds">
									<xsl:choose>
										<xsl:when test="aux0!='X' or aux1!='X' or hysteresis!='X'">
											<td bgcolor="#CCFFCC" align='center'>
												<xsl:value-of select="aux0"/> - <xsl:value-of select="aux1"/> - <xsl:value-of select="hysteresis"/>
											</td>
										</xsl:when>
										<xsl:otherwise>
											<xsl:choose>
												<xsl:when test="aux0='X' and aux1='X' and hysteresis='X'">
													<td align='center'> - </td>
												</xsl:when>
												<xsl:otherwise>
													<td align='center'>
														<xsl:value-of select="aux0"/> - <xsl:value-of select="aux1"/> - <xsl:value-of select="hysteresis"/>
													</td>
												</xsl:otherwise>
											</xsl:choose>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:for-each>
							</xsl:when>
							<xsl:otherwise>
								<td align='center'> - </td>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:for-each>
				</tr>
			</xsl:for-each>
		</table>
	</xsl:template>
</xsl:stylesheet>
<!-- end xsl -->

<!-- begin xsl -->
<?xml version="1.0" encoding="ISO-8859-1"?>
<!-- format_id=89-C3-95-3A-B8-E4-29-46-A5-26-C5-2C-88-62-6B-AE -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/active_policy_status">

<table border="1" id="monitor-active-fan-status-table">
	<tr bgcolor="#00AEEF" colspan="5">
		<th colspan="5">Active Fan Requests</th>
	</tr>
	<tr id="monitor-active-fan-status-table-header-row" bgcolor="#00AEEF">
		<th>Participant</th>
		<th>Max</th>
		<th>Requested Speed %</th>
		<th>Min</th>
		<th>Fine Grain</th>
	</tr>
	<xsl:for-each select="fan_status/active_cooling_control">
	<tr>
		<td align='left'><xsl:value-of select="name"/> (<xsl:value-of select="participant_index"/>)</td>
		<td align='right'><xsl:value-of select="max"/></td>
		<td align='right'><xsl:value-of select="speed"/></td>
		<td align='right'><xsl:value-of select="min"/></td>
		<td align='right'><xsl:value-of select="fine_grain"/></td>
	</tr>
	</xsl:for-each>
</table>

<br></br>

<table border="1" id="monitor-active-trip-point-status-table">
	<tr bgcolor="#00AEEF" colspan="16">
		<th colspan="16">Trip Point Status</th>
	</tr>
	<tr id="monitor-active-trip-point-status-table-header-row" bgcolor="#00AEEF">
		<th>Index</th>
		<th>Name</th>
		<th>Aux0</th>
		<th>Temp</th>
		<th>Aux1</th>
		<th>Hysteresis</th>
		<th>AC0</th>
		<th>AC1</th>
		<th>AC2</th>
		<th>AC3</th>
		<th>AC4</th>
		<th>AC5</th>
		<th>AC6</th>
		<th>AC7</th>
		<th>AC8</th>
		<th>AC9</th>
	</tr>
	<xsl:for-each select="active_trip_point_status/participant">
	<tr>
		<td align='right'><xsl:value-of select="index"/></td>
		<td><xsl:value-of select="name"/></td>
		<td align='right'><xsl:value-of select="temperature_thresholds/aux0"/></td>
		<td align='right'><xsl:value-of select="temperature"/></td>
		<td align='right'><xsl:value-of select="temperature_thresholds/aux1"/></td>
		<td align='right'><xsl:value-of select="temperature_thresholds/hysteresis"/></td>
		<td align='right'><xsl:value-of select="specific_info/ac0"/></td>
		<td align='right'><xsl:value-of select="specific_info/ac1"/></td>
		<td align='right'><xsl:value-of select="specific_info/ac2"/></td>
		<td align='right'><xsl:value-of select="specific_info/ac3"/></td>
		<td align='right'><xsl:value-of select="specific_info/ac4"/></td>
		<td align='right'><xsl:value-of select="specific_info/ac5"/></td>
		<td align='right'><xsl:value-of select="specific_info/ac6"/></td>
		<td align='right'><xsl:value-of select="specific_info/ac7"/></td>
		<td align='right'><xsl:value-of select="specific_info/ac8"/></td>
		<td align='right'><xsl:value-of select="specific_info/ac9"/></td>
	</tr>
	</xsl:for-each>
</table>

<br></br>

<table id="monitor-art-table" border="1">
	<tr bgcolor="#00AEEF" colspan="15">
		<th colspan="15">Active Relationship Table (ART)</th>
	</tr>
	<tr id="monitor-art-table-header-row" bgcolor="#00AEEF">
		<th>Target Index</th>
		<th>Target Object ID</th>
		<th>Source Index</th>
		<th>Source Object ID</th>
		<th>Weight</th>
		<th>AC0</th>
		<th>AC1</th>
		<th>AC2</th>
		<th>AC3</th>
		<th>AC4</th>
		<th>AC5</th>
		<th>AC6</th>
		<th>AC7</th>
		<th>AC8</th>
		<th>AC9</th>
	</tr>
	<xsl:for-each select="art/art_entry">
	<tr>
		<td align='right'><xsl:value-of select="target_index"/></td>
		<td><xsl:value-of select="target_acpi_scope"/></td>
		<td align='right'><xsl:value-of select="source_index"/></td>
		<td><xsl:value-of select="source_acpi_scope"/></td>
		<td align='right'><xsl:value-of select="weight"/></td>
		<td align='right'><xsl:value-of select="ac0"/></td>
		<td align='right'><xsl:value-of select="ac1"/></td>
		<td align='right'><xsl:value-of select="ac2"/></td>
		<td align='right'><xsl:value-of select="ac3"/></td>
		<td align='right'><xsl:value-of select="ac4"/></td>
		<td align='right'><xsl:value-of select="ac5"/></td>
		<td align='right'><xsl:value-of select="ac6"/></td>
		<td align='right'><xsl:value-of select="ac7"/></td>
		<td align='right'><xsl:value-of select="ac8"/></td>
		<td align='right'><xsl:value-of select="ac9"/></td>
	</tr>
	</xsl:for-each>
</table>

</xsl:template>
</xsl:stylesheet>
<!-- end xsl -->

<!-- begin xsl -->
<?xml version="1.0" encoding="ISO-8859-1"?>
<!-- format_id=E7-8A-C6-97-FA-15-9C-49-B8-C9-5D-A8-1D-60-6E-0A -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/critical_policy_status">


<table border="1" id="monitor-critical-trip-point-status-table">
	<tr bgcolor="#00AEEF" colspan="6">
		<th colspan="6">Trip Point Status</th>
	</tr>
	<tr id="monitor-critical-trip-point-status-table-header-row" bgcolor="#00AEEF">
		<th>Index</th>
		<th>Name</th>
		<th>Temperature</th>
		<th>CR3</th>
		<th>HOT</th>
		<th>CRT</th>
	</tr>
	<xsl:for-each select="critical_trip_point_status/participant">
	<tr>
		<td align='right'><xsl:value-of select="index"/></td>
		<td><xsl:value-of select="name"/></td>
		<td align='right'><xsl:value-of select="temperature"/></td>
		<td align='right'><xsl:value-of select="specific_info/warm"/></td>
		<td align='right'><xsl:value-of select="specific_info/hot"/></td>
		<td align='right'><xsl:value-of select="specific_info/critical"/></td>
	</tr>
	</xsl:for-each>
</table>

</xsl:template>
</xsl:stylesheet>
<!-- end xsl -->

<!-- begin xsl -->
<?xml version="1.0" encoding="ISO-8859-1"?>
<!-- format_id=D6-41-A4-42-6A-AE-2B-46-A8-4B-4A-8C-E7-90-27-D3 -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/passive_policy_status">

<table border="1" id="monitor-passive-trip-point-status-table">
	<tr bgcolor="#00AEEF" colspan="7">
		<th colspan="7">Trip Point Status</th>
	</tr>
	<tr id="monitor-passive-trip-point-status-table-header-row" bgcolor="#00AEEF">
		<th>Participant</th>
		<th>Aux0</th>
		<th>Temp</th>
		<th>Aux1</th>
		<th>Hysteresis</th>
		<th>PSV</th>
		<th>NTT</th>
	</tr>
	<xsl:for-each select="passive_trip_point_status/participant">
	<tr>
		<td><xsl:value-of select="name"/> (<xsl:value-of select="index"/>)</td>
		<td align='right'><xsl:value-of select="temperature_thresholds/aux0"/></td>
		<td align='right'><xsl:value-of select="temperature"/></td>
		<td align='right'><xsl:value-of select="temperature_thresholds/aux1"/></td>
		<td align='right'><xsl:value-of select="temperature_thresholds/hysteresis"/></td>
		<td align='right'><xsl:value-of select="specific_info/passive"/></td>
		<td align='right'><xsl:value-of select="specific_info/ntt"/></td>
	</tr>
	</xsl:for-each>
</table>

<br></br>

<table border="1" id="monitor-passive-control-status-table">
	<tr bgcolor="#00AEEF" colspan="10">
		<th colspan="10">Control Status</th>
	</tr>
	<tr id="monitor-passive-control-status-table-header-row" bgcolor="#00AEEF">
		<th>Participant</th>
		<th>Domain</th>
		<th>Temp</th>
		<th>Util</th>
		<th>Priority</th>
		<th>Power</th>
		<th>P-State</th>
		<th>Core</th>
		<th>T-State</th>
		<th>Display</th>
	</tr>
	<xsl:for-each select="passive_control_status/participant_control_status">
	<xsl:for-each select="domain_control_status">
	<tr>
		<td><xsl:value-of select="../name"/> (<xsl:value-of select="../index"/>)</td>
		<td><xsl:value-of select="name"/> (<xsl:value-of select="index"/>)</td>
		<td align='right'><xsl:value-of select="temperature"/></td>
		<td align='right'><xsl:value-of select="util_status/utilization"/></td>
		<td align='right'><xsl:value-of select="priority"/></td>
		<xsl:for-each select="controls/control">
		<xsl:choose>
		<xsl:when test="current='X' and max!='X' and min!='X'">
		<td align='center' bgcolor="#ED1C24"><xsl:value-of select="max"/>-<xsl:value-of select="current"/>-<xsl:value-of select="min"/></td>
		</xsl:when>
		<xsl:when test="current!=max">
		<td align='center' bgcolor="#FFFF99"><xsl:value-of select="max"/>-<xsl:value-of select="current"/>-<xsl:value-of select="min"/></td>
		</xsl:when>
		<xsl:otherwise>
		<td align='center'><xsl:value-of select="max"/>-<xsl:value-of select="current"/>-<xsl:value-of select="min"/></td>
		</xsl:otherwise>
		</xsl:choose>
		</xsl:for-each>
	</tr>
	</xsl:for-each>
	</xsl:for-each>
</table>

<br></br>

<table id="monitor-trt-table" border="1">
	<tr bgcolor="#00AEEF" colspan="4">
		<th colspan="4">Thermal Relationship Table (TRT)</th>
	</tr>
	<tr id="monitor-trt-table-header-row" bgcolor="#00AEEF">
		<th>Target</th>
		<th>Source</th>
		<th>Influence</th>
		<th>Sample Period (s)</th>
	</tr>
	<xsl:for-each select="trt/trt_entry">
	<tr>
		<td><xsl:value-of select="target_acpi_scope"/> (<xsl:value-of select="target_index"/>)</td>
		<td><xsl:value-of select="source_acpi_scope"/> (<xsl:value-of select="source_index"/>)</td>
		<td align='right'><xsl:value-of select="influence"/></td>
		<td align='right'><xsl:value-of select="sampling_period"/></td>
	</tr>
	</xsl:for-each>
</table>

<br></br>

<table border="1" id="monitor-passive-trip-point-statistics-table">
	<tr bgcolor="#00AEEF" colspan="3">
		<th colspan="3">Trip Point Statistics</th>
	</tr>
	<tr id="monitor-passive-trip-point-statistics-table-header-row" bgcolor="#00AEEF">
		<th>Participant</th>
		<th>Time Since Last Trip</th>
		<th>Temperature Of Last Trip</th>
	</tr>
	<xsl:for-each select="trip_point_statistics/participant_trip_point_statistics">
	<xsl:if test="supports_trip_points='true'">
	<tr>
		<td><xsl:value-of select="participant_name"/>(<xsl:value-of select="participant_index"/>)</td>
		<td align='right'><xsl:value-of select="time_since_last_trip"/></td>
		<td align='right'><xsl:value-of select="temperature_of_last_trip"/></td>
	</tr>
	</xsl:if>
	</xsl:for-each>
</table>

<br></br>

<table border="1" id="monitor-passive-source-availability-schedule-table">
	<tr bgcolor="#00AEEF" colspan="2">
		<th colspan="2">Source Availability Schedule</th>
	</tr>
	<tr id="monitor-passive-source-availability-schedule-table-header-row" bgcolor="#00AEEF">
		<th>Source</th>
		<th>Next Time Available (S)</th>
	</tr>
	<xsl:for-each select="callback_scheduler/source_availability/activity">
	<tr>
		<td><xsl:value-of select="source"/></td>
		<td align='right'><xsl:value-of select="time_until_available"/></td>
	</tr>
	</xsl:for-each>
</table>

<br></br>

<table border="1" id="monitor-passive-target-callback-schedule-table">
	<tr bgcolor="#00AEEF" colspan="2">
		<th colspan="2">Target Callback Schedule</th>
	</tr>
	<tr id="monitor-passive-target-callback-schedule-table-header-row" bgcolor="#00AEEF">
		<th>Target</th>
		<th>Next Callback Time (S)</th>
	</tr>
	<xsl:for-each select="callback_scheduler/policy_callback_scheduler/participant_callback">
	<tr>
		<td><xsl:value-of select="participant_index"/></td>
		<td align='right'><xsl:value-of select="time_until_expires"/></td>
	</tr>
	</xsl:for-each>
</table>

<br></br>

<table border="1" id="monitor-passive-utilization-threshold-table">
	<tr id="monitor-passive-utilization-threshold-table-header-row" bgcolor="#00AEEF" colspan="1">
		<th colspan="1">Utilization Threshold</th>
	</tr>
	<tr>
	 <td><xsl:value-of select="utilization_threshold"/></td>
	</tr>
 </table>
 
</xsl:template>
</xsl:stylesheet>
<!-- end xsl -->

<!-- begin xsl -->
<?xml version="1.0" encoding="ISO-8859-1"?>
<!-- format_id=5A-11-04-9E-87-AE-1C-4D-95-00-0F-3E-34-0B-FE-75 -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/passive_policy2_status">
<!--  style="position: relative; top: 00px; left: 0px;"-->
<div>
	<div>
		<table border="1" id="monitor-passive2-targets-table">
			<tr bgcolor="#00AEEF" colspan="12">
				<th colspan="12">Targets</th>
			</tr>
			<tr id="monitor-passive2-targets-table-header-row" bgcolor="#00AEEF">
				<th align='left' style='max-width:80px; min-width:80px;'>Target</th>
				<th align='left' style='max-width:90px; min-width:90px;'>Monitored</th>
				<th align='right' style='max-width:90px; min-width:90px;'>Resume Time</th>
				<th align='right' style='max-width:60px; min-width:60px;'>Aux0</th>
				<th align='right' style='max-width:60px; min-width:60px;'>Current Temp</th>
				<th align='right' style='max-width:60px; min-width:60px;'>Aux1</th>
				<th align='right' style='max-width:60px; min-width:60px;'>Hyst</th>
				<th align='left' style='max-width:80px; min-width:80px;'>Source</th>
				<th align='left' style='max-width:80px; min-width:80px;'>Domain</th>
				<th align='left' style='max-width:220px; min-width:220px;'>Control Knob</th>
				<th align='right' style='max-width:90px; min-width:90px;'>Requested Value</th>
				<th align='right' style='max-width:90px; min-width:90px;'>Preferred State</th>
			</tr>
			<xsl:for-each select="court_status/targets/target">
				<xsl:variable name="part-name">
					<xsl:value-of select="target_name"/>
				</xsl:variable>
			<tr>
				<td><xsl:value-of select="target_name"/> (<xsl:value-of select="target_id"/>)</td>
				<td><xsl:value-of select="trial/is_in_session"/></td>
				<td align='right'><xsl:value-of select="trial/participant_callback/time_until_expires"/></td>
				<td align='right'><xsl:value-of select="temperature_thresholds/aux0"/></td>
				<td align='right'><xsl:value-of select="current_temperature"/></td>
				<td align='right'><xsl:value-of select="temperature_thresholds/aux1"/></td>
				<td align='right'><xsl:value-of select="temperature_thresholds/hysteresis"/></td>
				<td colspan='6'>
					<table border="1" id="monitor-passive2-targets-sub-table-{$part-name}">
							<xsl:for-each select="trial/representative">
								<tr>
									<td style='max-width:80px; min-width:80px;'><xsl:value-of select="client_status/source_domain_knob/source_name"/> 
										(<xsl:value-of select="client_status/source_domain_knob/source_index"/>)</td>
									<td style='max-width:80px; min-width:80px;'><xsl:value-of select="client_status/source_domain_knob/domain_name"/> 
										(<xsl:value-of select="client_status/source_domain_knob/domain_index"/>)</td>
									<td style='max-width:220px; min-width:220px;'><xsl:value-of select="client_status/source_domain_knob/control_type"/></td>
									<td align='right' style='max-width:90px; min-width:90px;'><xsl:value-of select="client_status/last_set_preferred_state"/></td>
									<td align='right' style='max-width:90px; min-width:90px;'><xsl:value-of select="targetted_preferred_state"/></td>
								</tr>
							</xsl:for-each>
					</table>
				</td>
			</tr>
			</xsl:for-each>
		</table>
	</div>

	<br></br>

	<div style="width: 1188px">
		<table border="1" style="float: right;" id="monitor-passive2-sources-table">
			<tr bgcolor="#00AEEF" colspan="7">
				<th colspan="7">Sources</th>
			</tr>
			<tr id="monitor-passive2-sources-table-header-row" bgcolor="#00AEEF">
				<th align='left' style='max-width:80px; min-width:80px;'>Source</th>
				<th align='left' style='max-width:80px; min-width:80px;'>Domain</th>
				<th align='left' style='max-width:220px; min-width:220px;'>Control Type</th>
				<th align='center' style='max-width:90px; min-width:90px;'>Max</th>
				<th align='center' style='max-width:90px; min-width:90px;'>Requested Value</th>
				<th align='center' style='max-width:90px; min-width:90px;'>Min</th>
				<th align='center' style='max-width:90px; min-width:90px;'>Granted Value</th>
			</tr>
			<xsl:for-each select="court_status/clients/client">
				<tr>
					<td align='left'>
						<xsl:value-of select="source_domain_knob/source_name"/> (<xsl:value-of select="source_domain_knob/source_index"/>)
					</td>
					<td align='left'>
						<xsl:value-of select="source_domain_knob/domain_name"/> (<xsl:value-of select="source_domain_knob/domain_index"/>)
					</td>
					<td align='left'>
						<xsl:value-of select="source_domain_knob/control_type"/>
					</td>
					<td align='center'>
						<xsl:value-of select="max"/>
					</td>
						<xsl:choose>
							<xsl:when test="val!=max">
								<td align='center' bgcolor="#FFFF99">
									<xsl:value-of select="val"/>
								</td>
							</xsl:when>
							<xsl:otherwise>
								<td align='center'>
									<xsl:value-of select="val"/>
								</td>
							</xsl:otherwise>
						</xsl:choose>
						<td align='center'>
							<xsl:value-of select="min"/>
						</td>
						<xsl:choose>
							<xsl:when test="granted_value!=max">
								<td align='center' bgcolor="#FFFF99">
									<xsl:value-of select="granted_value"/>
								</td>
							</xsl:when>
							<xsl:otherwise>
								<td align='center'>
									<xsl:value-of select="granted_value"/>
								</td>
							</xsl:otherwise>
						</xsl:choose>
					</tr>
			</xsl:for-each>
		</table>

		<table border="1" style="float: left;" id="monitor-passive2-trip-point-statistics-table">
			<tr bgcolor="#00AEEF" colspan="3">
				<th colspan="3">Trip Point Statistics</th>
			</tr>
			<tr id="monitor-passive2-trip-point-statistics-table-header-row" bgcolor="#00AEEF">
				<th align='left' style='max-width:80px; min-width:80px;'>Target</th>
				<th align='right' style='max-width:80px; min-width:80px;'>Time</th>
				<th align='right' style='max-width:80px; min-width:80px;'>Temp</th>
			</tr>
			<xsl:for-each select="trip_point_statistics/participant_trip_point_statistics">
				<xsl:if test="supports_trip_points='true'">
					<tr>
						<td>
							<xsl:value-of select="participant_name"/> (<xsl:value-of select="participant_index"/>)
						</td>
						<td align='right'>
							<xsl:value-of select="time_since_last_trip"/>
						</td>
						<td align='right'>
							<xsl:value-of select="temperature_of_last_trip"/>
						</td>
					</tr>
				</xsl:if>
			</xsl:for-each>
		</table>
	</div>

	<div style="clear: both;"></div>

	<br></br>

	<div>
		<xsl:variable name="table-mode">
			<xsl:value-of select="psvt/control_mode"/>
		</xsl:variable>
			<table id="monitor-psvt-table" border="1" mode="{$table-mode}">
			<tr bgcolor="#00AEEF">
				<xsl:if test="psvt/control_mode">
					<th colspan="11">Passive Relationship Table (PSVT) (<xsl:value-of select="psvt/control_mode"/>)</th>
				</xsl:if>
				<xsl:if test="not(psvt/control_mode)">
					<th colspan="11">Passive Relationship Table (PSVT)</th>
				</xsl:if>
			</tr>
			<tr id="monitor-psvt-table-header-row" bgcolor="#00AEEF">
				<th align='center'>Target</th>
				<th align='center' width='60px'>Trip Point Temperature</th>
				<th align='center' width='60px'>Sample Period (s)</th>
				<th align='center' width='60px'>Priority</th>
				<th align='center'>Source</th>
				<th align='center'>Domain</th>
				<th align='center'>Control Knob</th>
				<th align='center' width='60px'>Limit</th>
				<th align='center' width='60px'>Step Size</th>
				<th align='center' width='80px'>Limit Coefficient</th>
				<th align='center' width='80px'>Unlimit Coefficient</th>
			</tr>
			<xsl:for-each select="psvt/psvt_entry">
				<tr>
					<td align='center'>
						<xsl:value-of select="target_device_scope"/> (<xsl:value-of select="target_index"/>)
					</td>
					<td align='center'>
						<xsl:value-of select="passive_temperature_setting/passive_temperature"/>
					</td>
					<td align='center'>
						<xsl:value-of select="passive_temperature_setting/sampling_period"/>
					</td>
					<td align='center'>
						<xsl:value-of select="passive_temperature_setting/priority"/>
					</td>
					<td align='center'>
						<xsl:value-of select="source_device_scope"/> (<xsl:value-of select="source_index"/>)
					</td>
					<td align='center'>
						<xsl:value-of select="source_domain"/> (<xsl:value-of select="domain_index"/>)
					</td>
					<td align='center'>
						<xsl:value-of select="control_knob"/>
					</td>
					<td align='center'>
						<xsl:value-of select="passive_temperature_setting/limit"/>
					</td>
					<td align='center'>
						<xsl:value-of select="passive_temperature_setting/step_size"/>
					</td>
					<td align='center'>
						<xsl:value-of select="passive_temperature_setting/limit_coefficient"/>
					</td>
					<td align='center'>
						<xsl:value-of select="passive_temperature_setting/unlimit_coefficient"/>
					</td>
				</tr>
			</xsl:for-each>
		</table>
	</div>
</div>

	</xsl:template>
</xsl:stylesheet>
<!-- end xsl -->

<!-- begin xsl -->
<?xml version="1.0" encoding="ISO-8859-1"?>
<!-- format_id=49-18-CE-C4-3A-24-F3-49-B8-D5-F9-70-02-F3-8E-6A -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/rfim_policy_status">

<table border="1" id="monitor-rfim-policy-table">
	<tr bgcolor="#00AEEF" colspan="2">
		<th colspan="2">RFIM Policy</th>
	</tr>
	<xsl:choose>
		<xsl:when test="count(rfim_policy_table_elements/rfim_policy_table_element) &gt; 0">
			<xsl:for-each select="rfim_policy_table_elements/rfim_policy_table_element">
				<tr>
					<th>
						<xsl:value-of select="row_header" />
					</th>
					<td align='right'>
						<xsl:value-of select="state" />
					</td>
				</tr>
			</xsl:for-each>
		</xsl:when>
		<xsl:otherwise>
			<th>No table elements</th>
		</xsl:otherwise>
	</xsl:choose>
</table>

<br></br>

<table border="1" id="monitor-rfim-fivr-devices-table">
	<tr bgcolor="#00AEEF" colspan="8">
		<th colspan="8">FIVR Devices</th>
	</tr>
	<tr id="monitor-rfim-fivr-devices-table-header-row" bgcolor="#00AEEF">
		<th>Participant</th>
		<th>Domain</th>
		<th>Min Frequency (Hz)</th>
		<th>Center Frequency (Hz)</th>
		<th>Requested Frequency (Hz)</th>
		<th>Max Frequency (Hz)</th>
		<th>SSC (%)</th>
	</tr>
	<xsl:for-each select="fivr_device_list/fivr_device">
	<tr>
		<td align='left'><xsl:value-of select="participant_name"/> (<xsl:value-of select="participant_index"/>)</td>
		<td align='left'><xsl:value-of select="domain_name"/> (<xsl:value-of select="domain_index"/>)</td>
		<td align='right'><xsl:value-of select="radio_frequency_control/min_frequency"/></td>
		<td align='right'><xsl:value-of select="radio_frequency_control/center_frequency"/></td>
		<td align='right'><xsl:value-of select="radio_frequency_control/requested_frequency"/></td>
		<td align='right'><xsl:value-of select="radio_frequency_control/max_frequency"/></td>
		<td align='right'><xsl:value-of select="radio_frequency_control/ssc"/></td>
	</tr>
	</xsl:for-each>
</table>

<br></br>

<table border="1" id="monitor-rfim-radio-devices-table">
	<tr bgcolor="#00AEEF" colspan="9">
		<th colspan="9">Radio Devices</th>
	</tr>
	<tr id="monitor-rfim-radio-devices-table-header-row" bgcolor="#00AEEF">
		<th>Participant</th>
		<th>Domain</th>
		<th align='center' style='max-width:90px; min-width:90px;'>Is WWAN 5G</th>
		<th align='center' style='max-width:90px; min-width:90px;'>WWAN Serving Cell Info</th>
		<th align='center' style='max-width:90px; min-width:90px;'>Center Frequency (Hz)</th>
		<th align='center' style='max-width:90px; min-width:90px;'>Left Spread (Hz)</th>
		<th align='center' style='max-width:90px; min-width:90px;'>Right Spread (Hz)</th>
		<th align='center' style='max-width:90px; min-width:90px;'>Channel Number</th>
		<th align='center' style='max-width:260px; min-width:260px;'>Band</th>
	</tr>
	<xsl:for-each select="radio_device_list/radio_device">
		<xsl:variable name="part-name">
			<xsl:value-of select="participant_name"/>
		</xsl:variable>
	<tr>
		<td align='left'><xsl:value-of select="participant_name"/> (<xsl:value-of select="participant_index"/>)</td>
		<td align='left'><xsl:value-of select="domain_name"/> (<xsl:value-of select="domain_index"/>)</td>
		<td colspan='7'>
			<table border="1" style="width:100%" id="monitor-rfim-radio-profile-data-set-table-{$part-name}">
				<xsl:for-each select="radio_profile_data_set/radio_frequency_profile_data">
					<tr>
						<td align='center' style='max-width:90px; min-width:90px;'><xsl:value-of select="is_5G"/></td>
						<td align='center' style='max-width:90px; min-width:90px;'><xsl:value-of select="serving_cell_info"/></td>
						<td align='center' style='max-width:90px; min-width:90px;'><xsl:value-of select="center_frequency"/></td>
						<td align='center' style='max-width:90px; min-width:90px;'><xsl:value-of select="left_frequency_spread"/></td>
						<td align='center' style='max-width:90px; min-width:90px;'><xsl:value-of select="right_frequency_spread"/></td>
						<td align='center' style='max-width:90px; min-width:90px;'><xsl:value-of select="channel_number"/></td>
						<td align='center' style='max-width:260px; min-width:260px;'><xsl:value-of select="band"/></td>
					</tr>
				</xsl:for-each>
			</table>
		</td>
	</tr>
	</xsl:for-each>
</table>

<br></br>

<table border="1" id="monitor-rfim-fivr-frequency-found-status-table">
	<tr bgcolor="#00AEEF" colspan="2">
		<th colspan="2">RFIM Status</th>
	</tr>
	<tr>
		<th>Found FIVR Frequency</th>
		<td align='right'>
			<xsl:value-of select="found_fivr_frequency" />
		</td>
  </tr>
  <tr>
		<th>Widest Band Center Frequency</th>
		<td align='right'>
			<xsl:value-of select="widest_band_center_frequency" />
		</td>
  </tr>
</table>

<br></br>
	
<table border="1" id="monitor-rfim-wifi-capabilities-table">
	<tr bgcolor="#00AEEF" colspan="2">
		<th colspan="2">WiFi Capabilities</th>
	</tr>
	<xsl:choose>
		<xsl:when test="count(wifi_capability_list/wifi_capability) &gt; 0">
			<xsl:for-each select="wifi_capability_list/wifi_capability">
				<tr>
					<th>
						<xsl:value-of select="wifi_capability_name" />
					</th>
					<td align='right'>
						<xsl:value-of select="wifi_capability_value" />
					</td>
				</tr>
			</xsl:for-each>
		</xsl:when>
		<xsl:when test="count(wifi_driver_connected) &gt; 0">
			<tr>
				<th>
					<xsl:value-of select="wifi_driver_connected/message" />
				</th>
			</tr>
		</xsl:when>
		<xsl:otherwise>
			<tr>
				<th>No WiFi driver connected</th>
			</tr>
		</xsl:otherwise>
	</xsl:choose>
</table>

<br></br>

<table id="monitor-ddrf-table" border="1">
	<tr bgcolor="#00AEEF" colspan="16">
		<th colspan="16">WiFi DDR RFI Table</th>
	</tr>
		<xsl:choose>
			<xsl:when test="count(ddrf/ddrf_entry) &gt; 0">
				<tr id="monitor-ddrf-table-header-row" bgcolor="#00AEEF">
					<th align='left'>DDR Frequency (MHz)</th>
					<th align='left'>Band (GHz)</th>
					<th align='right'>Channel 0</th>
					<th align='right'>Channel 1</th>
					<th align='right'>Channel 2</th>
					<th align='right'>Channel 3</th>
					<th align='right'>Channel 4</th>
					<th align='right'>Channel 5</th>
					<th align='right'>Channel 6</th>
					<th align='right'>Channel 7</th>
					<th align='right'>Channel 8</th>
					<th align='right'>Channel 9</th>
					<th align='right'>Channel 10</th>
					<th align='right'>Channel 11</th>
					<th align='right'>Channel 12</th>
					<th align='right'>Channel 13</th>
					<th align='right'>Channel 14</th>
				</tr>
				<xsl:for-each select="ddrf/ddrf_entry">
					<tr>
						<td align='left'>
							<xsl:value-of select="ddr_frequency"/>
						</td>
						<td align='left'>
							<xsl:value-of select="ddr_band"/>
						</td>
						<td align='right'>
							<xsl:value-of select="frequency_channel0"/>
						</td>
						<td align='right'>
							<xsl:value-of select="frequency_channel1"/>
						</td>
						<td align='right'>
							<xsl:value-of select="frequency_channel2"/>
						</td>
						<td align='right'>
							<xsl:value-of select="frequency_channel3"/>
						</td>
						<td align='right'>
							<xsl:value-of select="frequency_channel4"/>
						</td>
						<td align='right'>
							<xsl:value-of select="frequency_channel5"/>
						</td>
						<td align='right'>
							<xsl:value-of select="frequency_channel6"/>
						</td>
						<td align='right'>
							<xsl:value-of select="frequency_channel7"/>
						</td>
						<td align='right'>
							<xsl:value-of select="frequency_channel8"/>
						</td>
						<td align='right'>
							<xsl:value-of select="frequency_channel9"/>
						</td>
						<td align='right'>
							<xsl:value-of select="frequency_channel10"/>
						</td>
						<td align='right'>
							<xsl:value-of select="frequency_channel11"/>
						</td>
						<td align='right'>
							<xsl:value-of select="frequency_channel12"/>
						</td>
						<td align='right'>
							<xsl:value-of select="frequency_channel13"/>
						</td>
						<td align='right'>
							<xsl:value-of select="frequency_channel14"/>
						</td>
					</tr>
				</xsl:for-each>
			</xsl:when>
		<xsl:otherwise>
			<th>Table is Empty</th>
		</xsl:otherwise>
	</xsl:choose>
</table>

<br></br>

<table border="1" id="monitor-rfim-protected-frequency-table">
	<tr bgcolor="#00AEEF" colspan="2">
		<th colspan="2">Protected DDR Frequency (for WIFI)</th>
	</tr>
	<tr>
		<th>Frequency Rate (MHz)</th>
		<td align='right'>
			<xsl:value-of select="protected_frequency_value" />
		</td>
	</tr>
</table>

<br></br>
	
<table border="1" id="monitor-rfim-dvfs-rates-table">
	<tr bgcolor="#00AEEF" colspan="8">
		<th colspan="8">DVFS Frequency Rates</th>
	</tr>
	<tr id="monitor-rfim-fivr-devices-table-header-row" bgcolor="#00AEEF">
		<th>DVFS Rate 0</th>
		<th>DVFS Rate 1</th>
		<th>DVFS Rate 2</th>
		<th>DVFS Rate 3</th>
	</tr>
	<tr>
		<td align='right'>
			<xsl:value-of select="dvfs_rate_0"/>
		</td>
		<td align='right'>
			<xsl:value-of select="dvfs_rate_1"/>
		</td>
		<td align='right'>
			<xsl:value-of select="dvfs_rate_2"/>
		</td>
		<td align='right'>
			<xsl:value-of select="dvfs_rate_3"/>
		</td>
	</tr>
</table>

<br></br>

<table border="1" id="monitor-rfim-ddr-WWAN-protected-frequency-table">
	<tr bgcolor="#00AEEF" colspan="2">
		<th colspan="2">Protected DDR Frequency (for WWAN)</th>
	</tr>
	<tr>
		<th>Frequency Rate (MHz)</th>
		<td align='right'>
			<xsl:value-of select="protected_ddr_WWAN_frequency_value" />
		</td>
	</tr>
</table>
	
<br></br>
	
</xsl:template>
</xsl:stylesheet>
<!-- end xsl -->

<!-- begin xsl -->
<?xml version="1.0" encoding="ISO-8859-1"?>
<!-- format_id=0F-27-BE-63-11-1C-FD-48-A6-F7-3A-F2-53-FF-3E-2D -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/adaptive_performance_policy_status">

<div style="float:left;">
	<table id="monitor-apct-table" border="1" style="width:100%">
		<tr bgcolor="#00AEEF" colspan="7">
			<th colspan="7">Adaptive Performance Conditions Table (APCT)</th>
		</tr>
		<tr id="monitor-apct-table-header-row" bgcolor="#00AEEF" colspan="7">
			<th>Action Set</th>
			<th>Minterm</th>
		</tr>
		<xsl:for-each select="conditions_table/conditions_table_entry">
			<xsl:variable name="current_action">
				<xsl:value-of select="action_id"/>
			</xsl:variable>
			<tr>
			<xsl:choose>
				<xsl:when test="../../active_action!=action_id">
					<td>
						<xsl:for-each select="../../actions_table/actions_table_entry[action_id=$current_action]">
						<xsl:if test="position()=1">
							<xsl:value-of select="action_set"/>
						</xsl:if>
						</xsl:for-each>
					</td>
				</xsl:when>
				<xsl:otherwise>
					<td bgcolor="#FFFF99">
						<xsl:for-each select="../../actions_table/actions_table_entry[action_id=$current_action]">
						<xsl:if test="position()=1">
							<xsl:value-of select="action_set"/>
						</xsl:if>
						</xsl:for-each>
					</td>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:choose>
				<xsl:when test="count(logical_operation) &gt; 0">
					<td colspan="6">
						<table id="minterm-table-for-action-{$current_action}" colspan="6" style="width:100%" cellpadding="5" cellspacing="2">
							<xsl:for-each select="logical_operation">
								<tr>
									<xsl:choose>
										<xsl:when test="operator='FOR'">
											<xsl:choose>
												<xsl:when test="minterm/result!='false'">
													<td id="cond" style="border:thin solid; width:20%" align='center' bgcolor="#FFFF99"><xsl:value-of select="minterm/condition"/></td>
													<td id="participantScope" style="border:thin solid; width:20%" align='center' bgcolor="#FFFF99"><xsl:value-of select="minterm/participant_scope"/> (<xsl:value-of select="minterm/participant_index"/>)</td>
													<td id="domain" style="border:thin solid; width:20%" align='center' bgcolor="#FFFF99"><xsl:value-of select="minterm/domain_type"/> (<xsl:value-of select="minterm/domain_index"/>)</td>
													<td id="comp" style="border:thin solid; width:10%" align='center' bgcolor="#FFFF99"><xsl:value-of select="minterm/comparison"/></td>
													<td id="arg" style="border:thin solid; width:10%" align='center' bgcolor="#FFFF99"><xsl:value-of select="minterm/argument"/></td>
													<xsl:choose>
														<xsl:when test="result!='false'">
															<td id="op" style="border:thin solid; width:10%" align='center' bgcolor="#FFFF99">
																FOR Time >= <xsl:value-of select="time"/> sec
															</td>
														</xsl:when>
														<xsl:otherwise>
															<td id="op" style="border:thin solid; width:10%" align='center'>
																FOR Time >= <xsl:value-of select="time"/> sec
															</td>
														</xsl:otherwise>
													</xsl:choose>
												</xsl:when>
												<xsl:otherwise>
													<td id="cond" style="border:thin solid; width:20%" align='center'><xsl:value-of select="minterm/condition"/></td>
													<td id="participantScope" style="border:thin solid; width:20%" align='center'><xsl:value-of select="minterm/participant_scope"/> (<xsl:value-of select="minterm/participant_index"/>)</td>
													<td id="domain" style="border:thin solid; width:20%" align='center'><xsl:value-of select="minterm/domain_type"/> (<xsl:value-of select="minterm/domain_index"/>)</td>
													<td id="comp" style="border:thin solid; width:10%" align='center'><xsl:value-of select="minterm/comparison"/></td>
													<td id="arg" style="border:thin solid; width:10%" align='center'><xsl:value-of select="minterm/argument"/></td>
													<td id="op" style="border:thin solid; width:10%" align='center'>
														FOR Time >= <xsl:value-of select="time"/> sec
													</td>
												</xsl:otherwise>
											</xsl:choose>
											<xsl:choose>
												<xsl:when test="is_last">
													<td id="extra" style="border:thin solid; width:10%" align='center' bgcolor="#D3D3D3"></td>
												</xsl:when>
												<xsl:otherwise>
													<td id="extra" style="border:thin solid; width:10%" align='center'>AND</td>
												</xsl:otherwise>
											</xsl:choose>
										</xsl:when>
										<xsl:otherwise>
											<xsl:choose>
												<xsl:when test="minterm/result!='false'">
													<td id="cond" style="border:thin solid; width:20%" align='center' bgcolor="#FFFF99"><xsl:value-of select="minterm/condition"/></td>
													<td id="participantScope" style="border:thin solid; width:20%" align='center' bgcolor="#FFFF99"><xsl:value-of select="minterm/participant_scope"/> (<xsl:value-of select="minterm/participant_index"/>)</td>
													<td id="domain" style="border:thin solid; width:20%" align='center' bgcolor="#FFFF99"><xsl:value-of select="minterm/domain_type"/> (<xsl:value-of select="minterm/domain_index"/>)</td>
													<td id="comp" style="border:thin solid; width:10%" align='center' bgcolor="#FFFF99"><xsl:value-of select="minterm/comparison"/></td>
													<td id="arg" style="border:thin solid; width:10%" align='center' bgcolor="#FFFF99"><xsl:value-of select="minterm/argument"/></td>
												</xsl:when>
												<xsl:otherwise>
													<td id="cond" style="border:thin solid; width:20%" align='center'><xsl:value-of select="minterm/condition"/></td>
													<td id="participantScope" style="border:thin solid; width:20%" align='center'><xsl:value-of select="minterm/participant_scope"/> (<xsl:value-of select="minterm/participant_index"/>)</td>
													<td id="domain" style="border:thin solid; width:20%" align='center'><xsl:value-of select="minterm/domain_type"/> (<xsl:value-of select="minterm/domain_index"/>)</td>
													<td id="comp" style="border:thin solid; width:10%" align='center'><xsl:value-of select="minterm/comparison"/></td>
													<td id="arg" style="border:thin solid; width:10%" align='center'><xsl:value-of select="minterm/argument"/></td>
												</xsl:otherwise>
											</xsl:choose>
											<xsl:choose>
												<xsl:when test="operator">
													<td id="op" style="border:thin solid; width:10%" align='center' colspan="2">
														<xsl:value-of select="operator"/>
													</td>
												</xsl:when>
												<xsl:otherwise>
													<td id="op" style="border:thin solid; width:10%" align='center' bgcolor="#D3D3D3" colspan="2"></td>
												</xsl:otherwise>
											</xsl:choose>
										</xsl:otherwise>
									</xsl:choose>
								</tr>
							</xsl:for-each>
						</table>
					</td>
				</xsl:when>
				<xsl:otherwise>
					<td align='center' colspan='6' bgcolor="#FFFF99">No Op: Take Default Action</td>
				</xsl:otherwise>
			</xsl:choose>
		</tr>
	</xsl:for-each>
	</table>
	<br></br>
	</div>

		<xsl:if test="count(oem_variables/variable) &gt; 0">
			<div style ="float:right;">
				<table id="monitor-ap-odvp-table" border="1" style="width:100%">
					<tr bgcolor="#00AEEF" colspan="2">
						<th colspan="2">OEM Variables (ODVP)</th>
					</tr>
					<tr id="monitor-ap-odvp-table-header-row" bgcolor="#00AEEF">
						<th>ID</th>
						<th>Value</th>
					</tr>
					<xsl:for-each select="oem_variables/variable">
						<tr>
							<td align='center'>
								<xsl:value-of select="position() - 1"/>
							</td>
							<td align='right'>
								<xsl:value-of select="."/>
							</td>
						</tr>
					</xsl:for-each>
				</table>
				<br></br>
			</div>
		</xsl:if>

		<xsl:if test="count(workload_hint_configuration/workload_group) &gt; 0">
			<div style ="float:right;padding:0px 50px 0px 0px;width:350px">
				<table id="monitor-workload-table" border="1" style="width:100%;table-layout:fixed">
					<tr bgcolor="#00AEEF" colspan="2">
						<th colspan="2">Workload Hint Configuration</th>
					</tr>
					<tr id="monitor-workload-table-header-row" bgcolor="#00AEEF">
						<th>Workload Hint Value</th>
						<th>Application Names</th>
					</tr>
					<xsl:for-each select="workload_hint_configuration/workload_group">
						<tr>
							<td align='left'>
								<xsl:value-of select="id"/>
							</td>
							<td align='right' style="word-wrap:break-word">
								<xsl:for-each select="applications/application">
									<xsl:value-of select="current()"/>
									<br/>
								</xsl:for-each>
							</td>
						</tr>
					</xsl:for-each>
				</table>
				<br></br>
			</div>
		</xsl:if>
		<!-- Needed to re-align the following divs from the left of screen-->
		<div style="clear:both;"></div>

	<!-- Needed to re-align the following divs from the left of screen-->
	<div style="clear:both;"></div>

	<div style="float:left;">
	<table id="monitor-apat-table" border="1" style="width:100%">
		<tr bgcolor="#00AEEF" colspan="5">
			<th colspan="5">Adaptive Performance Actions Table (APAT)</th>
		</tr>
		<tr id="monitor-apat-table-header-row" bgcolor="#00AEEF">
			<th>Action Set</th>
			<th>Participant</th>
			<th>Domain</th>
			<th>Code</th>
			<th>Argument</th>
		</tr>
		<xsl:for-each select="actions_table/actions_table_entry">
			<xsl:choose>
				<xsl:when test="/adaptive_performance_policy_status/active_action!=action_id">
					<tr>
						<td align='left'><xsl:value-of select="action_set"/></td>
						<td align='left'><xsl:value-of select="participant_scope"/> (<xsl:value-of select="participant_index"/>)</td>
						<td align='left'><xsl:value-of select="domain"/> (<xsl:value-of select="domain_index"/>)</td>
						<td align='left'><xsl:value-of select="code"/></td>
						<xsl:choose>
								<xsl:when test="argument=4294967295">
										<td align='left'>Disabled</td>
								</xsl:when>
								<xsl:otherwise>
										<td align='left'><xsl:value-of select="argument"/></td>
								</xsl:otherwise>
						</xsl:choose>
					</tr>
				</xsl:when>
				<xsl:otherwise>
					<tr>
						<td align='left' bgcolor="#FFFF99"><xsl:value-of select="action_set"/></td>
						<td align='left' bgcolor="#FFFF99"><xsl:value-of select="participant_scope"/> (<xsl:value-of select="participant_index"/>)</td>
						<td align='left' bgcolor="#FFFF99"><xsl:value-of select="domain"/> (<xsl:value-of select="domain_index"/>)</td>
						<td align='left' bgcolor="#FFFF99"><xsl:value-of select="code"/></td>
						<xsl:choose>
							<xsl:when test="argument=4294967295">
									<td align='left' bgcolor="#FFFF99">Disabled</td>
							</xsl:when>
							<xsl:otherwise>
								<td align='left' bgcolor="#FFFF99"><xsl:value-of select="argument"/></td>
							</xsl:otherwise>
						</xsl:choose>
					</tr>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
	</table>
<br></br>
	</div>

	<xsl:if test="has_temperature_condition='true'">
		<div style="float:right;">
			<table border="1" style="width:100%" id="monitor-ap-trip-point-statistics-table">
				<tr bgcolor="#00AEEF" colspan="3">
					<th colspan="3">Trip Point Statistics</th>
				</tr>
				<tr id="monitor-ap-trip-point-statistics-table-header-row" bgcolor="#00AEEF">
					<th align='center' style='max-width:80px; min-width:80px;'>Target</th>
					<th align='center' style='max-width:80px; min-width:80px;'>Time</th>
					<th align='center' style='max-width:80px; min-width:80px;'>Temp</th>
				</tr>
				<xsl:for-each select="trip_point_statistics/participant_trip_point_statistics">
					<xsl:if test="supports_trip_points='true'">
						<tr>
							<td>
								<xsl:value-of select="participant_name"/> (<xsl:value-of select="participant_index"/>)
							</td>
							<td align='center'>
								<xsl:value-of select="time_since_last_trip"/>
							</td>
							<td align='center'>
								<xsl:value-of select="temperature_of_last_trip"/>
							</td>
						</tr>
					</xsl:if>
				</xsl:for-each>
			</table>
		
			<br></br>
		
		<table border="1" style="width:100%" id="monitor-ap-thresholds-table">
			<tr bgcolor="#00AEEF" colspan="5">
				<th colspan="5">Thresholds</th>
			</tr>
			<tr bgcolor="#00AEEF" colspan="5">
				<th colspan="5">(adjusted according to condition type)</th>
			</tr>
			<tr id="monitor-ap-thresholds-table-header-row" bgcolor="#00AEEF">
				<th align='center' style='max-width:80px; min-width:80px;'>Target</th>
				<th align='center' style='max-width:80px; min-width:80px;'>Hysteresis</th>
				<th align='center' style='max-width:80px; min-width:80px;'>Aux0</th>
				<th align='center' style='max-width:80px; min-width:80px;'>Current Temp</th>
				<th align='center' style='max-width:80px; min-width:80px;'>Aux1</th>
			</tr>
				<xsl:for-each select="thresholds/target">
					<tr>
						<td><xsl:value-of select="target_name"/> (<xsl:value-of select="target_index"/>)</td>
						<td align='center'><xsl:value-of select="temperature_thresholds/hysteresis"/></td>
						<td align='center'><xsl:value-of select="temperature_thresholds/aux0"/></td>
						<td align='center'><xsl:value-of select="current_temperature"/></td>
						<td align='center'><xsl:value-of select="temperature_thresholds/aux1"/></td>
					</tr>
				</xsl:for-each>
		</table>
		<br></br>
		</div>
	</xsl:if>

	<!-- Needed to re-align the following divs from the left of screen-->
	<div style="clear:both;"></div>
	<div style="float:left;">
		<xsl:if test="count(conditions_table/conditions_table_entry/logical_operation/timer_status/time_until_expires) &gt; 0">
			<table border="1" id="monitor-ap-timers-table">
				<tr bgcolor="#00AEEF" colspan="3">
					<th colspan="3">Timers</th>
				</tr>
				<tr id="monitor-ap-timers-table-header-row" bgcolor="#00AEEF">
					<th>Action Set</th>
					<th>Condition</th>
					<th>Timer Countdown</th>
				</tr>
				<xsl:for-each select="conditions_table/conditions_table_entry">
					<xsl:variable name="current_action">
						<xsl:value-of select="action_id"/>
					</xsl:variable>
					<xsl:variable name="set_name">
						<xsl:for-each select="../../actions_table/actions_table_entry[action_id=$current_action]">
							<xsl:if test="position()=1">
								<xsl:value-of select="action_set"/>
							</xsl:if>
						</xsl:for-each>
					</xsl:variable>
					<xsl:for-each select="logical_operation">
						<tr>
							<xsl:if test="operator='FOR'">
								<td align='center'><xsl:value-of select="$set_name"/></td>
								<td align='center'><xsl:value-of select="minterm/condition"/></td>
								<td align='center'><xsl:value-of select="timer_status/time_until_expires"/></td>
							</xsl:if>
						</tr>
					</xsl:for-each>
				</xsl:for-each>
			</table>
		</xsl:if>
		<br></br>
	</div>

	<!-- Needed to re-align the following divs from the left of screen-->
	<div style="clear:both;"></div>
	<div style="float:left;">
<table border="1" id="monitor-ap-conditions-table">
	<tr bgcolor="#00AEEF" colspan="6">
		<th colspan="6">Conditions</th>
	</tr>
	<tr id="monitor-ap-conditions-table-header-row" bgcolor="#00AEEF">
		<th>Type</th>
		<th>Participant</th>
		<th>Domain Type</th>
		<th>Last Known Value</th>
		<th>Is Supported</th>
		<th>Is In APCT</th>
	</tr>
	<xsl:for-each select="conditions_directory/condition">
		<xsl:choose>
			<xsl:when test="is_valid='false'">
				<tr>
					<td align='center' bgcolor="#FF7F7F"><xsl:value-of select="condition_type"/></td>
					<td align='center' bgcolor="#FF7F7F"><xsl:value-of select="participant_scope"/> (<xsl:value-of select="participant_index"/>)</td>
					<td align='center' bgcolor="#FF7F7F"><xsl:value-of select="domain_type"/> (<xsl:value-of select="domain_index"/>)</td>
					<td align='center' bgcolor="#FF7F7F"><xsl:value-of select="current_value"/></td>
					<td align='center' bgcolor="#FF7F7F"><xsl:value-of select="is_valid"/></td>
					<td align='center' bgcolor="#FF7F7F"><xsl:value-of select="is_in_use"/></td>
				</tr>
			</xsl:when>
			<xsl:otherwise>
				<xsl:choose>
				<xsl:when test="is_in_use='true'">
					<tr>
						<td align='center' bgcolor="#99E799"><xsl:value-of select="condition_type"/></td>
						<td align='center' bgcolor="#99E799"><xsl:value-of select="participant_scope"/> (<xsl:value-of select="participant_index"/>)</td>
						<td align='center' bgcolor="#99E799"><xsl:value-of select="domain_type"/> (<xsl:value-of select="domain_index"/>)</td>
						<td align='center' bgcolor="#99E799"><xsl:value-of select="current_value"/></td>
						<td align='center' bgcolor="#99E799"><xsl:value-of select="is_valid"/></td>
						<td align='center' bgcolor="#99E799"><xsl:value-of select="is_in_use"/></td>
					</tr>
				</xsl:when>
					<xsl:otherwise>
						<tr>
							<td align='center'><xsl:value-of select="condition_type"/></td>
							<td align='center'><xsl:value-of select="participant_scope"/> (<xsl:value-of select="participant_index"/>)</td>
							<td align='center'><xsl:value-of select="domain_type"/> (<xsl:value-of select="domain_index"/>)</td>
							<td align='center'><xsl:value-of select="current_value"/></td>
							<td align='center'><xsl:value-of select="is_valid"/></td>
							<td align='center'><xsl:value-of select="is_in_use"/></td>
						</tr>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:for-each>
</table>
<br></br>
	</div>

	<xsl:if test="count(request_directory/request) &gt; 0">
		<div style="float:right;">
			<table border="1" style="width:100%" id="monitor-ap-requested-values-table">
				<tr bgcolor="#00AEEF" colspan="4">
					<th colspan="4">Requested Values</th>
				</tr>
				<tr id="monitor-ap-requested-values-table-header-row" bgcolor="#00AEEF">
					<th>Participant</th>
					<th>Domain</th>
					<th>Code</th>
					<th>Value</th>
				</tr>
				<xsl:for-each select="request_directory/request">
					<tr>
						<td align='left'>
							<xsl:value-of select="participant_scope"/> (<xsl:value-of select="participant_index"/>)
						</td>
						<td align='left'>
							<xsl:value-of select="domain"/> (<xsl:value-of select="domain_index"/>)
						</td>
						<td align='left'>
							<xsl:value-of select="code"/>
						</td>
						<td align='left'>
							<xsl:value-of select="argument"/>
						</td>
					</tr>
				</xsl:for-each>
			</table>
			<br></br>
		</div>
	</xsl:if>

	<!-- Needed to re-align the following divs from the left of screen-->
	<div style="clear:both;"></div>

</xsl:template>
</xsl:stylesheet>
<!-- end xsl -->

<!-- begin xsl -->
<?xml version="1.0" encoding="ISO-8859-1"?>
<!-- format_id=A7-22-D7-6E-40-92-A5-48-B4-79-31-EE-F7-23-D7-CF -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/virtual_sensor_policy_status">
		<xsl:choose>
		<xsl:when test="count(virtual_sensor_directory/virtual_sensor_control) &gt; 0">
		<xsl:for-each select="virtual_sensor_directory/virtual_sensor_control">
			<xsl:variable name="part_name">
				<xsl:value-of select="participant_name"/>
			</xsl:variable>
			 <xsl:variable name="current_poll">
			<xsl:value-of select="participant_callback/current_polling_period"/>
		</xsl:variable>
			<div class='{$part_name}'>
				<h2>
					<xsl:value-of select="participant_name" /> - <xsl:value-of select="participant_description" />
				</h2>
				<table>
					<tr>
						<!-- Virtual Sensor details-->
						<table border="1" id="monitor-virtual-sensor-participant-properties-table-{$part_name}">
							<tr id="monitor-virtual-sensor-participant-properties-table-{$part_name}-header-row" bgcolor="#00AEEF" colspan="2">
								<th colspan="2">Participant Properties</th>
							</tr>
							<tr>
								<td>Participant Index</td>
								<td>
									<xsl:value-of select="participant_index" />
								</td>
							</tr>
							<tr>
								<td>Domain Index</td>
								<td>
									<xsl:value-of select="domain_index" />
								</td>
							</tr>
							<tr>
								<td>Device Scope</td>
								<td>
									<xsl:value-of select="device_scope" />
								</td>
							</tr>
							<tr>
								<td>Last Calculated Temperature</td>
								<xsl:choose>
									<xsl:when test="last_calculated_temperature &gt;= 100">
										<td style="color:red">
											<xsl:value-of select="last_calculated_temperature" />
										</td>
									</xsl:when>
									<xsl:when test="last_calculated_temperature &lt;= 0">
										<td style="color:blue">
											<xsl:value-of select="last_calculated_temperature" />
										</td>
									</xsl:when>
									<xsl:otherwise>
										<td>
											<xsl:value-of select="last_calculated_temperature" />
										</td>
									</xsl:otherwise>
								</xsl:choose>
							</tr>
							<tr>
								<td>Last Set Temperature (C)</td>
								<xsl:choose>
									<xsl:when test="last_set_temperature &gt;= 100">
										<td style="color:red">
											<xsl:value-of select="last_set_temperature" />
										</td>
									</xsl:when>
									<xsl:when test="last_set_temperature &lt;= 0">
										<td style="color:blue">
											<xsl:value-of select="last_set_temperature" />
										</td>
									</xsl:when>
									<xsl:otherwise>
										<td>
											<xsl:value-of select="last_set_temperature" />
										</td>
									</xsl:otherwise>
								</xsl:choose>
							</tr>
							<tr>
								<td>Time to next poll (s)</td>
								<td>
									<xsl:value-of select="participant_callback/time_until_expires" />
								</td>
							</tr>
							<tr>
								<td>Current Poll Period</td>
								<td>
									<xsl:value-of select="participant_callback/current_polling_period" />
								</td>
							</tr>
						</table>
						<br></br>
						<!-- End Virtual Sensor details-->
					</tr>
					<tr>
						<!-- Virtual Sensor Targets -->
						<table border="1" id="monitor-virtual-sensor-targets-table-{$part_name}">
							<tr bgcolor="#00AEEF" colspan="6">
								<th colspan="6">Targets</th>
							</tr>
							<tr id="monitor-virtual-sensor-targets-table-{$part_name}-header-row" bgcolor="#00AEEF">
								<th>Type</th>
								<th>Target</th>
								<th>Target Index</th>
								<th>Domain Type</th>
								<th>Domain Index</th>
								<th>Current Value</th>
							</tr>
							<xsl:for-each select="targets/virtual_sensor_target">
								<tr>
									<td align="left">
										<xsl:value-of select="target_type"/>
									</td>
									<td align="left">
										<xsl:value-of select="target_scope"/>
									</td>
									<td align="right">
										<xsl:value-of select="target_index"/>
									</td>
									<td align="right">
										<xsl:value-of select="domain_type"/>
									</td>
									<td align="right">
										<xsl:value-of select="domain_index"/>
									</td>
									<td align="right">
										<xsl:value-of select="current_value"/>
									</td>
								</tr>
							</xsl:for-each>
						</table>
						<br></br>
						<!-- End Virtual Sensor Targets -->
					</tr>
					<tr>
						<!-- Virtual Sensor Tables -->
						<table>
							<tr>
								<td colspan="8" align="left" valign="top">
									<table id="monitor-vsct-table-{$part_name}" border="1">
										<tr bgcolor="#00AEEF" colspan="8">
											<th colspan="8">Virtual Sensor Calibration Table (VSCT)</th>
										</tr>
										<tr id="monitor-vsct-table-{$part_name}-header-row" bgcolor="#00AEEF">
											<th>Target</th>
											<th>Domain Type</th>
											<th>Coefficient Type</th>
											<th>Coefficient</th>
											<th>Operation</th>
											<th>Alpha</th>
											<th>Last Calculated Average</th>
											<th>Trigger Point</th>
										</tr>
										<xsl:for-each select="vsct/vsct_entry">
											<tr>
												<td align="left">
													<xsl:value-of select="target_device_scope"/> (<xsl:value-of select="target_index"/>)
												</td>
												<td align="left">
													<xsl:value-of select="target_domain"/>
												</td>
												<td align="left">
													<xsl:value-of select="coefficient_type"/>
												</td>
												<td align="right">
													<xsl:value-of select="calibration_setting/coefficient"/>
												</td>
												<td align="center">
													<xsl:value-of select="calibration_setting/operation_type"/>
												</td>
												<td align="right">
													<xsl:value-of select="calibration_setting/alpha"/>
												</td>
												<td align="right">
													<xsl:value-of select="calibration_setting/last_calculated_average"/>
												</td>
												<td align="right">
													<xsl:value-of select="trigger_point"/>
												</td>
											</tr>
										</xsl:for-each>
									</table>
								</td>
								<td width="5"></td>
								<td colspan="2" align="right" valign="top">
									<table id="monitor-vspt-table-{$part_name}" border="1">
										<tr bgcolor="#00AEEF" colspan="2">
											<th colspan="2">Virtual Sensor Polling Table (VSPT)</th>
										</tr>
										<tr id="monitor-vspt-table-{$part_name}-header-row" bgcolor="#00AEEF">
											<th>Virtual Temperature</th>
											<th>Polling Period (s)</th>
										</tr>
										<xsl:for-each select="vspt/vspt_entry">
											<tr>
												<td align="right">
													<xsl:value-of select="virtual_temperature"/>
												</td>
												<xsl:choose>
													<xsl:when test="polling_period=$current_poll">
														<td align="right" bgcolor="#FFFF99">
															<xsl:value-of select="polling_period"/>
														</td>
													</xsl:when>
													<xsl:otherwise>
														<td align="right">
															<xsl:value-of select="polling_period"/>
														</td>
													</xsl:otherwise>
												</xsl:choose>
											</tr>
										</xsl:for-each>
									</table>
								</td>
							</tr>
						</table>
						<br></br>
						<!-- End Virtual Sensor Tables -->
					</tr>
				</table>
			</div>
		</xsl:for-each>
	</xsl:when>
	<xsl:otherwise>
		<td>No virtual sensors are enabled on the system at this time.</td>
	</xsl:otherwise>
		</xsl:choose>
		<br></br>

	</xsl:template>
</xsl:stylesheet>
<!-- end xsl -->

<!-- begin xsl -->
<?xml version="1.0" encoding="ISO-8859-1"?>
<!-- format_id=F0-CB-64-06-E4-2B-46-B5-9C-85-32-D1-A1-B7-CB-68 -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/participant">
	<xsl:variable name="part-name">
		<xsl:value-of select="participant_properties/name"/>
	</xsl:variable>
<table border="1" id="monitor-domain-participant-properties-table-{$part-name}">
	<tr id="monitor-domain-participant-properties-table-{$part-name}-header-row" bgcolor="#00AEEF" colspan="2">
		<th colspan="2">Participant Properties</th>
	</tr>
	<tr bgcolor="#00AEEF" colspan="2">
		<th colspan="2"><xsl:value-of select="participant_properties/name" /> - <xsl:value-of select="participant_properties/description" /></th>
	</tr>
	<tr>
		<td>Bus Type</td>
		<td><xsl:value-of select="participant_properties/bus_type" /></td>
	</tr>
	<tr>
		<td>ACPI Device</td>
		<td><xsl:value-of select="participant_properties/acpi_device" /></td>
	</tr>
	<tr>
		<td>Object ID</td>
		<td><xsl:value-of select="participant_properties/acpi_scope" /></td>
	</tr>
</table>
	
<br></br>

<xsl:for-each select="domains/domain">
	<xsl:variable name="domain-index">
		<xsl:value-of select="index"/>
	</xsl:variable>
	<table border="1" id="monitor-domain-supported-capabilities-table-{$part-name}-{$domain-index}">
		<tr id="monitor-domain-supported-capabilities-table-{$part-name}-{$domain-index}-header-row" bgcolor="#00AEEF" colspan="2">
			<th colspan="2">Supported Capabilities</th>
		</tr>
		<xsl:if test="domain_controls/active_control">
			<tr>
				<td align='center'><xsl:value-of select="domain_controls/active_control/control_name" /></td>
			</tr>
		</xsl:if>
		<xsl:if test="domain_controls/core_control">
			<tr>
				<td align='center'><xsl:value-of select="domain_controls/core_control/control_name" /></td>
			</tr>
		</xsl:if>
		<xsl:if test="domain_controls/display_control">
			<tr>
				<td align='center'><xsl:value-of select="domain_controls/display_control/control_name" /></td>
			</tr>
		</xsl:if>
		<xsl:if test="domain_controls/domain_priority">
			<tr>
				<td align='center'><xsl:value-of select="domain_controls/domain_priority/control_name" /></td>
			</tr>
		</xsl:if>
		<xsl:if test="domain_controls/performance_control">
			<tr>
				<td align='center'><xsl:value-of select="domain_controls/performance_control/control_name" /></td>
			</tr>
		</xsl:if>
		<xsl:if test="domain_controls/system_power_control">
			<tr>
				<td align='center'><xsl:value-of select="domain_controls/system_power_control/control_name" /></td>
			</tr>
		</xsl:if>
		<xsl:if test="domain_controls/platform_power_status">
			<tr>
				<td align='center'><xsl:value-of select="domain_controls/platform_power_status/control_name" /></td>
			</tr>
		</xsl:if>
		<xsl:if test="domain_controls/battery_status">
			<tr>
				<td align='center'>
					<xsl:value-of select="domain_controls/battery_status/control_name" />
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="domain_controls/platform_power_control">
			<tr>
				<td align='center'>
					<xsl:value-of select="domain_controls/platform_power_control/control_name" />
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="domain_controls/power_control">
			<tr>
				<td align='center'><xsl:value-of select="domain_controls/power_control/control_name" /></td>
			</tr>
		</xsl:if>
		<xsl:if test="domain_controls/power_status_set">
			<tr>
				<td align='center'><xsl:value-of select="domain_controls/power_status_set/control_name" /></td>
			</tr>
		</xsl:if>
		<xsl:if test="domain_controls/temperature_control">
			<tr>
				<td align='center'><xsl:value-of select="domain_controls/temperature_control/control_name" /></td>
			</tr>
		</xsl:if>
		<xsl:if test="domain_controls/util_status">
			<tr>
				<td align='center'><xsl:value-of select="domain_controls/util_status/control_name" /></td>
			</tr>
		</xsl:if>
		<xsl:if test="domain_controls/temperature_control/temperature_thresholds">
			<tr>
				<td align='center'><xsl:value-of select="domain_controls/temperature_control/temperature_thresholds/control_name" /></td>
			</tr>
		</xsl:if>
		<xsl:if test="domain_controls/rfprofile_status">
			<tr>
				<td align='center'><xsl:value-of select="domain_controls/rfprofile_status/control_name" /></td>
			</tr>
		</xsl:if>
		<xsl:if test="domain_controls/rfprofile_control">
			<tr>
				<td align='center'><xsl:value-of select="domain_controls/rfprofile_control/control_name" /></td>
			</tr>
		</xsl:if>
		<xsl:if test="domain_controls/activity_status">
			<tr>
				<td align='center'><xsl:value-of select="domain_controls/activity_status/control_name" /></td>
			</tr>
		</xsl:if>
		<xsl:if test="domain_controls/peak_power_control">
			<tr>
				<td align='center'><xsl:value-of select="domain_controls/peak_power_control/control_name" /></td>
			</tr>
		</xsl:if>
		<xsl:if test="domain_controls/processor_control">
			<tr>
				<td align='center'><xsl:value-of select="domain_controls/processor_control/control_name" /></td>
			</tr>
		</xsl:if>
		<xsl:if test="domain_controls/energy_control">
			<tr>
				<td align='center'><xsl:value-of select="domain_controls/energy_control/control_name" /></td>
			</tr>
		</xsl:if>
		<xsl:if test="domain_controls/soc_workload">
			<tr>
				<td align='center'>
					<xsl:value-of select="domain_controls/soc_workload/control_name" />
				</td>
			</tr>
		</xsl:if>
    <xsl:if test="domain_controls/dynamic_epp">
      <tr>
        <td align='center'>
          <xsl:value-of select="domain_controls/dynamic_epp/control_name" />
        </td>
      </tr>
    </xsl:if>
	</table>
</xsl:for-each>

<br></br>


<xsl:if test="specific_info">
<table border="1" id="monitor-domain-specific-info-table-{$part-name}">
	<tr bgcolor="#00AEEF" colspan="15">
		<th colspan="15">Specific Info</th>
	</tr>
	<tr id="monitor-domain-specific-info-table-{$part-name}-header-row" bgcolor="#00AEEF">
		<th>CR3</th>
		<th>HOT</th>
		<th>CRT</th>
		<th>PSV</th>
		<th>NTT</th>
		<th>AC0</th>
		<th>AC1</th>
		<th>AC2</th>
		<th>AC3</th>
		<th>AC4</th>
		<th>AC5</th>
		<th>AC6</th>
		<th>AC7</th>
		<th>AC8</th>
		<th>AC9</th>
	</tr>
	<tr>
			<td align='right'><xsl:value-of select="specific_info/wrm" /></td>
			<td align='right'><xsl:value-of select="specific_info/hot" /></td>
			<td align='right'><xsl:value-of select="specific_info/crt" /></td>
			<td align='right'><xsl:value-of select="specific_info/psv" /></td>
			<td align='right'><xsl:value-of select="specific_info/ntt" /></td>
			<td align='right'><xsl:value-of select="specific_info/ac0" /></td>
			<td align='right'><xsl:value-of select="specific_info/ac1" /></td>
			<td align='right'><xsl:value-of select="specific_info/ac2" /></td>
			<td align='right'><xsl:value-of select="specific_info/ac3" /></td>
			<td align='right'><xsl:value-of select="specific_info/ac4" /></td>
			<td align='right'><xsl:value-of select="specific_info/ac5" /></td>
			<td align='right'><xsl:value-of select="specific_info/ac6" /></td>
			<td align='right'><xsl:value-of select="specific_info/ac7" /></td>
			<td align='right'><xsl:value-of select="specific_info/ac8" /></td>
			<td align='right'><xsl:value-of select="specific_info/ac9" /></td>
	</tr>
</table>
</xsl:if>

<xsl:for-each select="domains/domain">
	<xsl:variable name="domain-index">
		<xsl:value-of select="index"/>
	</xsl:variable>
	<h3>Domain #<xsl:value-of select="index" /> - <xsl:value-of select="name" /> (<xsl:value-of select="description" />)</h3>

	<!-- Domain Priority -->
	<xsl:if test="domain_controls/domain_priority/domain_priority">
		<table border="1" id="monitor-domain-domain-properties-table-{$part-name}-{$domain-index}">
			<tr id="monitor-domain-domain-properties-table-{$part-name}-{$domain-index}-header-row" bgcolor="#00AEEF" colspan="2">
				<th colspan="2">Domain Properties</th>
			</tr>
			<tr>
				<td>Priority</td>
				<td align='right'><xsl:value-of select="domain_controls/domain_priority/domain_priority" /></td>
			</tr>
		</table>
		<br></br>
	</xsl:if>
	<!-- END - Domain Priority -->

	<!-- Temperature Control -->
	<xsl:if test="domain_controls/temperature_control">
		<table border="1" id="monitor-domain-temperature-control-table-{$part-name}-{$domain-index}">
			<tr bgcolor="#00AEEF" colspan="4">
				<th colspan="4">Temperature Control</th>
			</tr>
			<tr id="monitor-domain-temperature-control-table-{$part-name}-{$domain-index}-header-row" bgcolor="#00AEEF">
				<xsl:if test="domain_controls/temperature_control/temperature_thresholds">
					<th>Aux 0</th>
				</xsl:if>
				<th>Temperature</th>
				<xsl:if test="domain_controls/temperature_control/temperature_thresholds">
					<th>Aux 1</th>
					<th>Hysteresis</th>
				</xsl:if>
			</tr>
			<tr>
				<xsl:if test="domain_controls/temperature_control/temperature_thresholds">
					<td align='right'><xsl:value-of select="domain_controls/temperature_control/temperature_thresholds/aux0" /></td>
				</xsl:if>
				<td align='right'><xsl:value-of select="domain_controls/temperature_control/temperature_status/temperature_status" /></td>
				<xsl:if test="domain_controls/temperature_control/temperature_thresholds">
					<td align='right'><xsl:value-of select="domain_controls/temperature_control/temperature_thresholds/aux1" /></td>
					<td align='right'><xsl:value-of select="domain_controls/temperature_control/temperature_thresholds/hysteresis" /></td>
				</xsl:if>
			</tr>
		</table>
		<br></br>
	</xsl:if>
	<!-- END - Temperature Control -->

	<!-- Performance Control -->
	<!-- Performance Control - Status -->
	<xsl:if test="domain_controls/performance_control">
		<table border="1" id="monitor-domain-perf-control-status-table-{$part-name}-{$domain-index}">
			<tr bgcolor="#00AEEF" colspan="2">
				<th colspan="2">Performance Control Status</th>
			</tr>
			<tr id="monitor-domain-perf-control-status-table-{$part-name}-{$domain-index}-header-row" bgcolor="#00AEEF">
				<th>Current Index</th>
			</tr>
			<tr>
				<td align='right'><xsl:value-of select="domain_controls/performance_control/performance_control_status/current_index" /></td>
			</tr>
		</table>
		<br></br>
	</xsl:if>
	<!-- END - Performance Control - Status -->

	<!-- Performance Control - Dynamic Caps -->
	<xsl:if test="domain_controls/performance_control">
		<table border="1" id="monitor-domain-perf-control-dynamic-caps-table-{$part-name}-{$domain-index}">
			<tr bgcolor="#00AEEF" colspan="2">
				<th colspan="2">Performance Control Dynamic Caps</th>
			</tr>
			<tr id="monitor-domain-perf-control-dynamic-caps-table-{$part-name}-{$domain-index}-header-row" bgcolor="#00AEEF">
				<th>Upper Limit</th>
				<th>Lower Limit</th>
			</tr>
			<tr>
				<td align='right'><xsl:value-of select="domain_controls/performance_control/performance_control_dynamic_caps/upper_limit_index" /></td>
				<td align='right'><xsl:value-of select="domain_controls/performance_control/performance_control_dynamic_caps/lower_limit_index" /></td>
			</tr>
		</table>
		<br></br>
	</xsl:if>
	<!-- END : Performance Control - Dynamic Caps -->

	<!-- Performance Control Set -->
	<xsl:if test="domain_controls/performance_control">
		<!-- First check to see if the table contains any real frequency data -->
		<xsl:variable name="total_performance">
			<xsl:value-of select="sum(domain_controls/performance_control/performance_control_set/performance_control/transition_latency) + 
			sum(domain_controls/performance_control/performance_control_set/performance_control/control_absolute_value)"/>
		</xsl:variable>
		<table border="1" id="monitor-domain-ppss-table-{$part-name}-{$domain-index}">
			<tr bgcolor="#00AEEF" colspan="7">
				<th colspan="7">Performance Control Set</th>
			</tr>
			<tr id="monitor-domain-ppss-table-{$part-name}-{$domain-index}-header-row" bgcolor="#00AEEF">
				<th>Index</th>
				<th>Type</th>
				<xsl:choose>
					<xsl:when test="$total_performance &gt; 0">
						<th>Control ID</th>
						<th>TDP Power (mW)</th>
						<th>Performance %</th>
						<th>Transition Latency (ms)</th>
						<th>Control Value</th>
					</xsl:when>
					<xsl:otherwise>
					</xsl:otherwise>
				</xsl:choose>
			</tr>
			<xsl:for-each select="domain_controls/performance_control/performance_control_set/performance_control">
			<tr>
				<td align='right'><xsl:value-of select="position() - 1" /></td>
				<td><xsl:value-of select="control_type" /></td>
				<xsl:choose>
					<xsl:when test="$total_performance &gt; 0">
						<td align='right'>
							<xsl:value-of select="control_id" />
						</td>
						<td align='right'>
							<xsl:value-of select="tdp_power" />
						</td>
						<td align='right'>
							<xsl:value-of select="performance_percentage" />
						</td>
						<td align='right'>
							<xsl:value-of select="transition_latency" />
						</td>
						<td align='right'>
							<xsl:value-of select="control_absolute_value" />&#160;
								<xsl:value-of select="value_units" />
						</td>
					</xsl:when>
					<xsl:otherwise>
					</xsl:otherwise>
				</xsl:choose>
			</tr>
			</xsl:for-each>
		</table>
		<br></br>
	</xsl:if>
	<!-- END : Performance Control Set -->
	<!-- END : Performance Control -->

	<!-- Power Status -->
	<xsl:if test="domain_controls/power_status_set">
		<table border="1" id="monitor-domain-power-status-table-{$part-name}-{$domain-index}">
			<tr bgcolor="#00AEEF" colspan="7">
				<th colspan="7">Power Status</th>
			</tr>
			<tr id="monitor-domain-power-status-table-{$part-name}-{$domain-index}-header-row" bgcolor="#00AEEF">
				<th>Current Power</th>
				<th>Last Power Used by Passive Policy</th>
			</tr>
			<tr>
				<td align='right'><xsl:value-of select="domain_controls/power_status_set/power_status/power" /></td>
				<td align='right'><xsl:value-of select="domain_controls/power_status_set/average_power_set/average_power/value" /></td>
			</tr>
		</table>
		<br></br>
	</xsl:if>
	<!-- END : Power Status -->

	<!-- Power Control Status -->
	<xsl:if test="domain_controls/power_control/power_limit_set">
		<table border="1" id="monitor-domain-power-control-status-table-{$part-name}-{$domain-index}">
			<tr bgcolor="#00AEEF" colspan="3">
				<th colspan="5">Power Control Status</th>
			</tr>
			<tr id="monitor-domain-power-control-status-table-{$part-name}-{$domain-index}-header-row" bgcolor="#00AEEF">
				<th>Control Type</th>
				<th>Enabled</th>
				<th>Power Limit</th>
				<th>Time Window</th>
				<th>Duty Cycle</th>
			</tr>
			<xsl:for-each select="domain_controls/power_control/power_limit_set/power_limit">
			<tr>
				<td align='left'><xsl:value-of select="type" /></td>
				<td align='right'><xsl:value-of select="enabled" /></td>
				<td align='right'><xsl:value-of select="limit_value" /></td>
				<td align='right'><xsl:value-of select="time_window" /></td>
				<td align='right'><xsl:value-of select="duty_cycle" /></td>
			</tr>
			</xsl:for-each>
		</table>
		<br></br>
	</xsl:if>
	<!-- END : Power Control Status -->

	<!-- SoC Power Floor Status -->
	<xsl:if test="domain_controls/power_control">
		<table border="1" id="monitor-domain-power-control-soc-power-floor-status-table-{$part-name}-{$domain-index}">
			<tr id="monitor-domain-power-control-soc-power-floor-status-table-{$part-name}-{$domain-index}-header-row" bgcolor="#00AEEF" colspan="2">
				<th colspan="2">SoC Power Floor Status</th>
			</tr>
			<tr>
				<th>Is Supported</th>
				<td align='right'>
					<xsl:value-of select="domain_controls/power_control/soc_power_floor_status/is_soc_power_floor_supported" />
				</td>
			</tr>
			<tr>
				<th>Enabled</th>
				<td align='right'>
					<xsl:value-of select="domain_controls/power_control/soc_power_floor_status/soc_power_floor_state" />
				</td>
			</tr>
		</table>
		<br></br>
	</xsl:if>
	<!-- END - SoC Power Floor Status -->

	<!-- Power Control Dynamic Caps -->
	<xsl:if test="domain_controls/power_control/power_control_dynamic_caps_set">
		<table border="1" id="monitor-domain-ppcc-table-{$part-name}-{$domain-index}">
			<tr bgcolor="#00AEEF" colspan="6">
				<th colspan="8">Power Control Dynamic Caps</th>
			</tr>
			<tr id="monitor-domain-ppcc-table-{$part-name}-{$domain-index}-header-row" bgcolor="#00AEEF">
				<th>Control Type</th>
				<th>Min Power Limit (mW)</th>
				<th>Max Power Limit (mW)</th>
				<th>Min Time Window</th>
				<th>Max Time Window</th>
				<th>Power Step Size</th>
			</tr>
			<xsl:for-each select="domain_controls/power_control/power_control_dynamic_caps_set/power_control_dynamic_caps">
			<tr>
				<td><xsl:value-of select="control_type" /></td>
				<xsl:choose>
					<xsl:when test="power_limit_caps_valid!='false'">
						<td align='right'><xsl:value-of select="min_power_limit" /></td>
						<td align='right'><xsl:value-of select="max_power_limit" /></td>
					</xsl:when>
					<xsl:otherwise>
						<td align='right' bgcolor="#FF7F7F"><xsl:value-of select="min_power_limit" /></td>
						<td align='right' bgcolor="#FF7F7F"><xsl:value-of select="max_power_limit" /></td>
					</xsl:otherwise>
				</xsl:choose>
				<xsl:choose>
					<xsl:when test="time_window_caps_valid!='false'">
						<td align='right'><xsl:value-of select="min_time_window" /></td>
						<td align='right'><xsl:value-of select="max_time_window" /></td>
					</xsl:when>
					<xsl:otherwise>
						<td align='right' bgcolor="#FF7F7F"><xsl:value-of select="min_time_window" /></td>
						<td align='right' bgcolor="#FF7F7F"><xsl:value-of select="max_time_window" /></td>
					</xsl:otherwise>
				</xsl:choose>
				<xsl:choose>
					<xsl:when test="power_step_size_valid!='false'">
						<td align='right'><xsl:value-of select="power_step_size" /></td>
					</xsl:when>
					<xsl:otherwise>
						<td align='right' bgcolor="#FF7F7F"><xsl:value-of select="power_step_size" /></td>
					</xsl:otherwise>
				</xsl:choose>
			</tr>
			</xsl:for-each>
		</table>
		<br></br>
	</xsl:if>
	<!-- END : Power Control Dynamic Caps -->

	<!-- Core Control -->
	<xsl:if test="domain_controls/core_control">
		<table border="1" id="monitor-domain-core-control-table-{$part-name}-{$domain-index}">
			<tr id="monitor-domain-core-control-table-{$part-name}-{$domain-index}-header-row" bgcolor="#00AEEF" colspan="2">
				<th colspan="2">Core Control</th>
			</tr>
			<tr>
				<td>Active Logical Processors</td>
				<td align='right'><xsl:value-of select="domain_controls/core_control/core_control_status/active_logical_processors" /></td>
			</tr>
			<tr>
				<td>Total Logical Processors</td>
				<td align='right'><xsl:value-of select="domain_controls/core_control/core_control_static_caps/total_logical_processors" /></td>
			</tr>
			<tr>
				<td>Max Active Cores</td>
				<td align='right'><xsl:value-of select="domain_controls/core_control/core_control_dynamic_caps/max_active_cores" /></td>
			</tr>
			<tr>
				<td>Min Active Cores</td>
				<td align='right'><xsl:value-of select="domain_controls/core_control/core_control_dynamic_caps/min_active_cores" /></td>
			</tr>
			<tr>
				<td>LPO Enabled</td>
				<td><xsl:value-of select="domain_controls/core_control/core_control_lpo_preference/lpo_enabled" /></td>
			</tr>
			<tr>
				<td>Start P-State</td>
				<td align='right'><xsl:value-of select="domain_controls/core_control/core_control_lpo_preference/start_p_state" /></td>
			</tr>
			<tr>
				<td>Power Offlining Mode</td>
				<td><xsl:value-of select="domain_controls/core_control/core_control_lpo_preference/power_control_offlining_mode" /></td>
			</tr>
			<tr>
				<td>Performance Offlining Mode</td>
				<td><xsl:value-of select="domain_controls/core_control/core_control_lpo_preference/performance_control_offlining_mode" /></td>
			</tr>
		</table>
	<br></br>
	</xsl:if>
	<!-- END : Core Control -->

	<!-- Display Control -->
	<xsl:if test="domain_controls/display_control">
		<table border="1" id="monitor-domain-display-status-table-{$part-name}-{$domain-index}">
			<tr bgcolor="#00AEEF" colspan="1">
				<th colspan="7">Display Status</th>
			</tr>
			<tr id="monitor-domain-display-status-table-{$part-name}-{$domain-index}-header-row" bgcolor="#00AEEF">
				<th>Brightness</th>
			</tr>
			<tr>
				<td align='right'><xsl:value-of select="domain_controls/display_control/display_control_status/brightness_limit_index" /></td>
			</tr>
		</table>

		<br></br>

		<table border="1" id="monitor-domain-display-control-dynamic-caps-table-{$part-name}-{$domain-index}">
			<tr bgcolor="#00AEEF" colspan="2">
				<th colspan="2">Display Control Dynamic Caps</th>
			</tr>
			<tr id="monitor-domain-display-control-dynamic-caps-table-{$part-name}-{$domain-index}-header-row" bgcolor="#00AEEF">
				<th>Upper Limit</th>
				<th>Lower Limit</th>
			</tr>
			<tr>
				<td align='right'><xsl:value-of select="domain_controls/display_control/display_control_dynamic_caps/upper_limit_index" /></td>
				<td align='right'><xsl:value-of select="domain_controls/display_control/display_control_dynamic_caps/lower_limit_index" /></td>
			</tr>
		</table>

		<br></br>

		<table border="1" id="monitor-domain-bcl-table-{$part-name}-{$domain-index}">
			<tr bgcolor="#00AEEF" colspan="2">
				<th colspan="2">Display Control Set</th>
			</tr>
			<tr id="monitor-domain-bcl-table-{$part-name}-{$domain-index}-header-row" bgcolor="#00AEEF">
				<th>Index</th>
				<th>Brightness %</th>
			</tr>
			<xsl:for-each select="domain_controls/display_control/display_control_set/display_control">
			<tr>
				<td align='right'><xsl:value-of select="position() - 1" /></td>
				<td align='right'><xsl:value-of select="brightness" />%</td>
			</tr>
			</xsl:for-each>
		</table>

		<br></br>

	</xsl:if>
	<!-- END: Display Control -->

	<!-- Active Control -->
	<xsl:if test="domain_controls/active_control">
		<table border="1" id="monitor-domain-fst-table-{$part-name}-{$domain-index}">
			<tr bgcolor="#00AEEF" colspan="2">
				<th colspan="2">Active Control Status</th>
			</tr>
			<tr id="monitor-domain-fst-table-{$part-name}-{$domain-index}-header-row" bgcolor="#00AEEF">
				<th>Control ID / Fan Speed %</th>
				<th>Speed (RPM) for Control ID</th>
			</tr>
			<tr>
				<td align='right'><xsl:value-of select="domain_controls/active_control/active_control_status/current_control_id" /></td>
				<td align='right'><xsl:value-of select="domain_controls/active_control/active_control_status/current_speed" /></td>
			</tr>
		</table>

		<br></br>

		<table border="1" id="monitor-domain-fif-table-{$part-name}-{$domain-index}">
			<tr bgcolor="#00AEEF" colspan="3">
				<th colspan="3">Active Control Static Caps</th>
			</tr>
			<tr id="monitor-domain-fif-table-{$part-name}-{$domain-index}-header-row" bgcolor="#00AEEF">
				<th>Fine Grained Control</th>
				<th>Low Speed Notification</th>
				<th>Step Size</th>
			</tr>
			<tr>
				<td><xsl:value-of select="domain_controls/active_control/active_control_static_caps/fine_grained_control" /></td>
				<td><xsl:value-of select="domain_controls/active_control/active_control_static_caps/low_speed_notification" /></td>
				<td align='right'><xsl:value-of select="domain_controls/active_control/active_control_static_caps/step_size" /></td>
			</tr>
		</table>

		<br></br>

		<table border="1" id="monitor-domain-fcdc-table-{$part-name}-{$domain-index}">
			<tr bgcolor="#00AEEF" colspan="2">
				<th colspan="2">Active Control Dynamic Caps</th>
			</tr>
			<tr id="monitor-domain-fcdc-table-{$part-name}-{$domain-index}-header-row" bgcolor="#00AEEF">
				<th>Min Fan Speed %</th>
				<th>Max Fan Speed %</th>
			</tr>
			<tr>
				<td><xsl:value-of select="domain_controls/active_control/active_control_dynamic_caps/min_fan_speed" /></td>
				<td><xsl:value-of select="domain_controls/active_control/active_control_dynamic_caps/max_fan_speed" /></td>
			</tr>
		</table>

		<br></br>
		
		<table border="1" id="monitor-domain-fps-table-{$part-name}-{$domain-index}">
			<tr bgcolor="#00AEEF" colspan="5">
				<th colspan="5">Active Control Set</th>
			</tr>
			<tr id="monitor-domain-fps-table-{$part-name}-{$domain-index}-header-row" bgcolor="#00AEEF">
				<th>Control ID</th>
				<th>Trip Point</th>
				<th>Speed (RPMs)</th>
				<th>Noise Level</th>
				<th>Power (mW)</th>
			</tr>
			<xsl:for-each select="domain_controls/active_control/active_control_set/active_control">
			<tr>
				<td align='right'><xsl:value-of select="control_id" /></td>
				<td align='right'><xsl:value-of select="trip_point" /></td>
				<td align='right'><xsl:value-of select="speed" /></td>
				<td align='right'><xsl:value-of select="noise_level" /></td>
				<td align='right'><xsl:value-of select="power" /></td>
			</tr>
			</xsl:for-each>
		</table>

		<br></br>

	</xsl:if>
	<!-- END: Active Control -->
		
	<!-- System Power Control -->
	<xsl:if test="domain_controls/system_power_control">
		<table border="1" id="monitor-domain-system-power-control-status-table-{$part-name}-{$domain-index}">
			<tr bgcolor="#00AEEF" colspan="5">
				<th colspan="5">System Power Control Status</th>
			</tr>
			<tr id="monitor-domain-system-power-control-status-table-{$part-name}-{$domain-index}-header-row" bgcolor="#00AEEF">
				<th>Control</th>
				<th>Enabled</th>
				<th>Power Limit</th>
				<th>Time Window</th>
				<th>Duty Cycle</th>
			</tr>
			<xsl:for-each select="domain_controls/system_power_control/system_power_limit_set/system_power_limit">
			<tr>
				<td align='right'><xsl:value-of select="type" /></td>
				<td align='right'><xsl:value-of select="enabled" /></td>
				<td align='right'><xsl:value-of select="limit_value" /></td>
				<td align='right'><xsl:value-of select="time_window" /></td>
				<td align='right'><xsl:value-of select="duty_cycle" /></td>
			</tr>
			</xsl:for-each>
		</table>
		<br></br>
	</xsl:if>
	<!-- END: System Power Control -->

	<!-- Platform Power Status -->
	<xsl:if test="domain_controls/platform_power_status">
		<xsl:for-each select="domain_controls/platform_power_status">
			<table border="1" id="monitor-domain-platform-power-status-table-{$part-name}-{$domain-index}">
				<tr id="monitor-domain-platform-power-status-table-{$part-name}-{$domain-index}-header-row" bgcolor="#00AEEF" colspan="2">
					<th colspan="2">
						Platform Power Status
					</th>
				</tr>
				<xsl:for-each select="platform_power_status_object">
					<tr>
						<th>
							<xsl:value-of select="name" />
						</th>
						<td align='right'>
							<xsl:value-of select="value" />
						</td>
					</tr>
				</xsl:for-each>
		</table>
		</xsl:for-each>
		<br></br>
	</xsl:if>
	<!-- END: Platform Power Status -->

	<!-- Battery Status -->
	<xsl:if test="domain_controls/battery_status">
		<xsl:for-each select="domain_controls/battery_status">
			<table border="1" id="monitor-domain-battery-status-table-{$part-name}-{$domain-index}">
				<tr id="monitor-domain-battery-status-table-{$part-name}-{$domain-index}-header-row" bgcolor="#00AEEF" colspan="2">
					<th colspan="2">
						Battery Status
					</th>
				</tr>
				<xsl:for-each select="battery_status_object">
					<tr>
						<th>
							<xsl:value-of select="name" />
						</th>
						<td align='right'>
							<xsl:value-of select="value" />
						</td>
					</tr>
				</xsl:for-each>
			</table>
		</xsl:for-each>
		<br></br>
	</xsl:if>
	<!-- END: Battery Status -->

	<!-- Peak Power Control -->
	<xsl:if test="domain_controls/peak_power_control">

		<xsl:for-each select="domain_controls/peak_power_control">
			<table border="1" id="monitor-domain-peak-power-control-table-{$part-name}-{$domain-index}">
				<tr id="monitor-domain-peak-power-control-table-{$part-name}-{$domain-index}-header-row" bgcolor="#00AEEF" colspan="2">
					<th colspan="2">Peak Power Control</th>
				</tr>
				<xsl:for-each select="peak_power_control_object">
					<tr>
						<th><xsl:value-of select="name" /></th>
						<td align='right'><xsl:value-of select="value" /></td>
					</tr>
				</xsl:for-each>
			</table>
		</xsl:for-each>
		<br></br>
	</xsl:if>
	<!-- END: Peak Power Control -->

	<!-- Processor Control -->
	<xsl:if test="domain_controls/processor_control">

		<xsl:for-each select="domain_controls/processor_control">
			<table border="1" id="monitor-domain-processor-control-table-{$part-name}-{$domain-index}">
				<tr id="monitor-domain-processor-control-table-{$part-name}-{$domain-index}-header-row" bgcolor="#00AEEF" colspan="2">
					<th colspan="2">Processor Control</th>
				</tr>
				<tr>
					<th>TCC Offset</th>
					<td align='right'><xsl:value-of select="tcc_offset" /></td>
				</tr>
				<tr>
					<th>Min TCC Offset</th>
					<td align='right'>
						<xsl:value-of select="min_tcc_offset" />
					</td>
				</tr>
				<tr>
					<th>Max TCC Offset</th>
					<td align='right'>
						<xsl:value-of select="max_tcc_offset" />
					</td>
				</tr>
				<tr>
					<th>Last Set UVTH</th>
					<td align='right'>
						<xsl:value-of select="last_set_uvth" />
					</td>
				</tr>
			</table>
		</xsl:for-each>
		<br></br>
	</xsl:if>
	<!-- END: Processor Control -->

	<!-- Soc Workload Classification Control -->
	<xsl:if test="domain_controls/soc_workload">

		<xsl:for-each select="domain_controls/soc_workload">
			<table border="1" id="monitor-domain-soc-workload-classification-control-table-{$part-name}-{$domain-index}">
				<tr id="monitor-domain-soc-workload-classification-control-table-{$part-name}-{$domain-index}-header-row" bgcolor="#00AEEF" colspan="2">
					<th colspan="2">Soc Workload Classification</th>
				</tr>
					<tr>
						<th>Soc Workload</th>
						<td align='right'>
							<xsl:value-of select="value" />
						</td>
					</tr>
			</table>
		</xsl:for-each>
		<br></br>
	</xsl:if>
	<!-- END: Soc Workload Classification Control -->

  <!-- Dynamic EPP Control -->
  <xsl:if test="domain_controls/dynamic_epp">

    <xsl:for-each select="domain_controls/dynamic_epp">
      <table border="1" id="monitor-domain-dynamic-epp-control-table-{$part-name}-{$domain-index}">
        <tr id="monitor-domain-dynamic-epp-control-table-{$part-name}-{$domain-index}-header-row" bgcolor="#00AEEF" colspan="2">
          <th colspan="2">Dynamic EPP</th>
        </tr>
        <tr>
          <th>EPP Sensitivity Hint (MBT)</th>
          <td align='right'>
            <xsl:value-of select="value" />
          </td>
        </tr>
      </table>
    </xsl:for-each>
    <br></br>
  </xsl:if>
  <!-- END: Dynamic EPP Control -->

</xsl:for-each>
</xsl:template>
</xsl:stylesheet>
<!-- end xsl -->

<!-- begin xsl -->
<?xml version="1.0" encoding="ISO-8859-1"?>
<!-- format_id=C5-61-4D-E9-30-80-4D-B5-98-1A-D1-D1-67-DD-4C-D7 -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/work_item_queue_manager_status">

<table border="1" id="monitor-workitem-manager-queue-statistics-table">
	<tr bgcolor="#00AEEF" colspan="4">
		<th colspan="4">Queue Statistics</th>
	</tr>
	<tr id="monitor-workitem-manager-queue-statistics-table-header-row" bgcolor="#00AEEF">
		<th>Queue</th>
		<th>Current Count</th>
		<th>Max Count</th>
		<th>Total Executed</th>
	</tr>
	<tr>
		<td>Immediate</td>
		<td align='right'>
			<xsl:value-of select="immediate_queue_statistics/current_count" />
		</td>
		<td align='right'>
			<xsl:value-of select="immediate_queue_statistics/max_count" />
		</td>
		<td align='right'>
			<xsl:value-of select="work_item_statistics/total_immediate_work_items_executed" />
		</td>
	</tr>
	<tr>
		<td>Deferred</td>
		<td align='right'>
			<xsl:value-of select="deferred_queue_statistics/current_count" />
		</td>
		<td align='right'>
			<xsl:value-of select="deferred_queue_statistics/max_count" />
		</td>
		<td align='right'>
			<xsl:value-of select="work_item_statistics/total_deferred_work_items_executed" />
		</td>
	</tr>
</table>

<br></br>

<table border="1" id="monitor-workitem-manager-workitem-statistics-table">
	<tr bgcolor="#00AEEF" colspan="8">
		<th colspan="8">Work Item Statistics</th>
	</tr>
	<tr id="monitor-workitem-manager-workitem-statistics-table-header-row" bgcolor="#00AEEF">
		<th>Work Item Type</th>
		<th>Total Executed</th>
		<th>Avg Execution Time</th>
		<th>Min Execution Time</th>
		<th>Max Execution Time</th>
		<th>Avg Queue Time</th>
		<th>Min Queue Time</th>
		<th>Max Queue Time</th>
	</tr>
	<xsl:for-each select="work_item_statistics/immediate_work_item_statistics/work_item">
		<tr>
			<td>
				<xsl:value-of select="work_item_type" />
			</td>
			<td align='right'>
				<xsl:value-of select="total_executed" />
			</td>
			<td align='right'>
				<xsl:value-of select="average_execution_time" />
			</td>
			<td align='right'>
				<xsl:value-of select="min_execution_time" />
			</td>
			<td align='right'>
				<xsl:value-of select="max_execution_time" />
			</td>
			<td align='right'>
				<xsl:value-of select="average_queue_time" />
			</td>
			<td align='right'>
				<xsl:value-of select="min_queue_time" />
			</td>
			<td align='right'>
				<xsl:value-of select="max_queue_time" />
			</td>
		</tr>
	</xsl:for-each>
</table>

</xsl:template>
</xsl:stylesheet>
<!-- end xsl -->

<!-- begin xsl -->
<?xml version="1.0" encoding="ISO-8859-1"?>
<!-- format_id=14-50-A3-F5-09-C2-A4-46-99-3A-EB-56-DE-75-30-A1 -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
		<xsl:template match="/power_boss_policy_status">
			<div style ="float:left;">
			<table id="monitor-pbct-table" border="1" style="width:100%">
				<tr bgcolor="#00AEEF" colspan="7">
					<th colspan="7">Power Boss Conditions Table (PBCT)</th>
				</tr>
				<tr id="monitor-pbct-table-header-row" bgcolor="#00AEEF" colspan="7">
					<th>Action Set</th>
					<th>Minterm</th>
				</tr>
				<xsl:for-each select="conditions_table/conditions_table_entry">
					<xsl:variable name="current_action">
						<xsl:value-of select="action_id"/>
					</xsl:variable>
					<tr>
						<xsl:choose>
							<xsl:when test="../../active_action!=action_id">
								<td>
									<xsl:for-each select="../../actions_table/actions_table_entry[action_id=$current_action]">
										<xsl:if test="position()=1">
											<xsl:value-of select="action_set"/>
										</xsl:if>
									</xsl:for-each>
								</td>
							</xsl:when>
							<xsl:otherwise>
								<td bgcolor="#FFFF99">
									<xsl:for-each select="../../actions_table/actions_table_entry[action_id=$current_action]">
										<xsl:if test="position()=1">
											<xsl:value-of select="action_set"/>
										</xsl:if>
									</xsl:for-each>
								</td>
							</xsl:otherwise>
						</xsl:choose>
						<xsl:choose>
							<xsl:when test="count(logical_operation) &gt; 0">
								<td colspan="6">
									<table id="minterm-table-for-action-{$current_action}" colspan="6" style="width:100%" cellpadding="5" cellspacing="2">
										<xsl:for-each select="logical_operation">
											<tr>
												<xsl:choose>
													<xsl:when test="minterm/result!='false'">
														<td id="cond" style="border:thin solid; width:20%" align='center' bgcolor="#FFFF99"><xsl:value-of select="minterm/condition"/></td>
														<td id="participantScope" style="border:thin solid; width:20%" align='center' bgcolor="#FFFF99"><xsl:value-of select="minterm/participant_scope"/> (<xsl:value-of select="minterm/participant_index"/>)</td>
														<td id="domain" style="border:thin solid; width:20%" align='center' bgcolor="#FFFF99"><xsl:value-of select="minterm/domain_type"/> (<xsl:value-of select="minterm/domain_index"/>)</td>
														<td id="comp" style="border:thin solid; width:10%" align='center' bgcolor="#FFFF99"><xsl:value-of select="minterm/comparison"/></td>
														<td id="arg" style="border:thin solid; width:10%" align='center' bgcolor="#FFFF99"><xsl:value-of select="minterm/argument"/></td>
													</xsl:when>
													<xsl:otherwise>
														<td id="cond" style="border:thin solid; width:20%" align='center'><xsl:value-of select="minterm/condition"/></td>
														<td id="participantScope" style="border:thin solid; width:20%" align='center'><xsl:value-of select="minterm/participant_scope"/> (<xsl:value-of select="minterm/participant_index"/>)</td>
														<td id="domain" style="border:thin solid; width:20%" align='center'><xsl:value-of select="minterm/domain_type"/> (<xsl:value-of select="minterm/domain_index"/>)</td>
														<td id="comp" style="border:thin solid; width:10%" align='center'><xsl:value-of select="minterm/comparison"/></td>
														<td id="arg" style="border:thin solid; width:10%" align='center'><xsl:value-of select="minterm/argument"/></td>
													</xsl:otherwise>
												</xsl:choose>
												<xsl:choose>
													<xsl:when test="operator">
														<td id="op" style="border:thin solid; width:10%" align='center'>
															<xsl:value-of select="operator"/>
														</td>
													</xsl:when>
													<xsl:otherwise>
														<td id="op" style="border:thin solid; width:10%" align='center' bgcolor="#D3D3D3"></td>
													</xsl:otherwise>
												</xsl:choose>
											</tr>
										</xsl:for-each>
									</table>
								</td>
							</xsl:when>
							<xsl:otherwise>
								<td align='center' colspan='6' bgcolor="#FFFF99">No Op: Take Default Action</td>
							</xsl:otherwise>
						</xsl:choose>
					</tr>
				</xsl:for-each>
			</table>
			<br></br>
			</div>

			<xsl:if test="count(oem_variables/variable) &gt; 0">
				<div style ="float:right;">
					<table id="monitor-pb-odvp-table" border="1" style="width:100%">
						<tr bgcolor="#00AEEF" colspan="2">
							<th colspan="2">OEM Variables (ODVP)</th>
						</tr>
						<tr id="monitor-pb-odvp-table-header-row" bgcolor="#00AEEF">
							<th>ID</th>
							<th>Value</th>
						</tr>
						<xsl:for-each select="oem_variables/variable">
							<tr>
								<td align='center'>
									<xsl:value-of select="position() - 1"/>
								</td>
								<td align='right'>
									<xsl:value-of select="."/>
								</td>
							</tr>
						</xsl:for-each>
					</table>
					<br></br>
				</div>
			</xsl:if>
			
			<!-- Needed to re-align the following divs from the left of screen-->
			<div style="clear:both;"></div>

			<div style="float:left;">
				<table id="monitor-pbat-table" border="1" style="width:100%">
					<tr bgcolor="#00AEEF" colspan="5">
						<th colspan="5">Power Boss Actions Table (PBAT)</th>
					</tr>
					<tr id="monitor-pbat-table-header-row" bgcolor="#00AEEF">
						<th>Action Set</th>
						<th>Participant</th>
						<th>Domain</th>
						<th>Code</th>
						<th>Argument</th>
					</tr>
					<xsl:for-each select="actions_table/actions_table_entry">
						<xsl:choose>
							<xsl:when test="/power_boss_policy_status/active_action!=action_id">
								<tr>
									<td align='left'><xsl:value-of select="action_set"/></td>
									<td align='left'><xsl:value-of select="participant_scope"/> (<xsl:value-of select="participant_index"/>)</td>
									<td align='left'><xsl:value-of select="domain"/> (<xsl:value-of select="domain_index"/>)</td>
									<td align='left'><xsl:value-of select="code"/></td>
									<td align='left'><xsl:value-of select="argument"/></td>
								</tr>
							</xsl:when>
							<xsl:otherwise>
								<tr>
									<td align='left' bgcolor="#FFFF99"><xsl:value-of select="action_set"/></td>
									<td align='left' bgcolor="#FFFF99"><xsl:value-of select="participant_scope"/> (<xsl:value-of select="participant_index"/>)</td>
									<td align='left' bgcolor="#FFFF99"><xsl:value-of select="domain"/> (<xsl:value-of select="domain_index"/>)</td>
									<td align='left' bgcolor="#FFFF99"><xsl:value-of select="code"/></td>
									<td align='left' bgcolor="#FFFF99"><xsl:value-of select="argument"/></td>
								</tr>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:for-each>
				</table>
				<br></br>
			</div>

			<xsl:if test="count(request_directory/request) &gt; 0">
				<div style="float:right;">
					<table border="1" style="width:100%" id="monitor-pb-requested-values-table">
						<tr bgcolor="#00AEEF" colspan="4">
							<th colspan="4">Requested Values</th>
						</tr>
						<tr id="monitor-pb-requested-values-table-header-row" bgcolor="#00AEEF">
							<th>Participant</th>
							<th>Domain</th>
							<th>Code</th>
							<th>Value</th>
						</tr>
						<xsl:for-each select="request_directory/request">
							<tr>
								<td align='left'>
									<xsl:value-of select="participant_scope"/> (<xsl:value-of select="participant_index"/>)
								</td>
								<td align='left'>
									<xsl:value-of select="domain"/> (<xsl:value-of select="domain_index"/>)
								</td>
								<td align='left'>
									<xsl:value-of select="code"/>
								</td>
								<td align='left'>
									<xsl:value-of select="argument"/>
								</td>
							</tr>
						</xsl:for-each>
					</table>
					<br></br>
				</div>
			</xsl:if>

			<!-- Needed to re-align the following divs from the left of screen-->
			<div style="clear:both;"></div>
			
			<xsl:if test="count(pbmt/pbmt_entry) &gt; 0">
				<div style="float:left;">
					<table id="monitor-pbmt-table" border="1">
						<tr bgcolor="#00AEEF" colspan="142">
							<th colspan="142">Power Boss Math Table (PBMT)</th>
						</tr>
						<tr>
							<th align="left" bgcolor="#00AEEF">Variable Name</th>
							<td id="monitor-pbmt-table-variable-column-header" align="left" bgcolor="#00AEEF">VARIABLE</td>
							<xsl:for-each select="pbmt/pbmt_entry">
								<td align='left'>
									<xsl:value-of select="variable"/>
								</td>
							</xsl:for-each>
						</tr>
						<tr>
							<th align="left" bgcolor="#00AEEF">Use AC_POWER Value</th>
							<td id="monitor-pbmt-table-sel_artg-column-header" align="left" bgcolor="#00AEEF">SEL_AC_POWER</td>
							<xsl:for-each select="pbmt/pbmt_entry">
								<td align='left'>
									<xsl:value-of select="sel_artg"/>
								</td>
							</xsl:for-each>
						</tr>
						<tr>
							<th align="left" bgcolor="#00AEEF">AC Power (mW)</th>
							<td id="monitor-pbmt-table-artg-column-header" align="left" bgcolor="#00AEEF">AC_POWER</td>
							<xsl:for-each select="pbmt/pbmt_entry">
								<td align='left'>
									<xsl:value-of select="artg"/>
								</td>
							</xsl:for-each>
						</tr>
						<tr>
							<th align="left" bgcolor="#00AEEF">AC Voltage (mV)</th>
							<td id="monitor-pbmt-table-avol-column-header" align="left" bgcolor="#00AEEF">AC_VOLTAGE</td>
							<xsl:for-each select="pbmt/pbmt_entry">
								<td align='left'>
									<xsl:value-of select="avol"/>
								</td>
							</xsl:for-each>
						</tr>
						<tr>
							<th align="left" bgcolor="#00AEEF">AC Current (mA)</th>
							<td id="monitor-pbmt-table-acur-column-header" align="left" bgcolor="#00AEEF">AC_CURRENT</td>
							<xsl:for-each select="pbmt/pbmt_entry">
								<td align='left'>
									<xsl:value-of select="acur"/>
								</td>
							</xsl:for-each>
						</tr>
						<tr>
							<th align="left" bgcolor="#00AEEF">AC Peak Percentage 1 (%)</th>
							<td id="monitor-pbmt-table-apxx_1-column-header" align="left" bgcolor="#00AEEF">AC_PK_PERCENTAGE_1</td>
							<xsl:for-each select="pbmt/pbmt_entry">
								<td align='left'>
									<xsl:value-of select="apxx_1"/>
								</td>
							</xsl:for-each>
						</tr>
						<tr>
							<th align="left" bgcolor="#00AEEF">AC Power Multiplier 1 (%)</th>
							<td id="monitor-pbmt-table-m_pac1-column-header" align="left" bgcolor="#00AEEF">M_PAC1</td>
							<xsl:for-each select="pbmt/pbmt_entry">
								<td align='left'>
									<xsl:value-of select="m_pac1"/>
								</td>
							</xsl:for-each>
						</tr>
						<tr>
							<th align="left" bgcolor="#00AEEF">AC Peak Percentage 2 (%)</th>
							<td id="monitor-pbmt-table-apxx_2-column-header" align="left" bgcolor="#00AEEF">AC_PK_PERCENTAGE_2</td>
							<xsl:for-each select="pbmt/pbmt_entry">
								<td align='left'>
									<xsl:value-of select="apxx_2"/>
								</td>
							</xsl:for-each>
						</tr>
						<tr>
							<th align="left" bgcolor="#00AEEF">AC Power Multiplier 2 (%)</th>
							<td id="monitor-pbmt-table-m_pac2-column-header" align="left" bgcolor="#00AEEF">M_PAC2</td>
							<xsl:for-each select="pbmt/pbmt_entry">
								<td align='left'>
									<xsl:value-of select="m_pac2"/>
								</td>
							</xsl:for-each>
						</tr>
						<tr>
							<th align="left" bgcolor="#00AEEF">Use PBSS For Battery Power</th>
							<td id="monitor-pbmt-table-sel_pbss-column-header" align="left" bgcolor="#00AEEF">SEL_DC_SUS_POWER</td>
							<xsl:for-each select="pbmt/pbmt_entry">
								<td align='left'>
									<xsl:value-of select="sel_pbss"/>
								</td>
							</xsl:for-each>
						</tr>
						<tr>
							<th align="left" bgcolor="#00AEEF">Use PMAX For Battery Power</th>
							<td id="monitor-pbmt-table-sel_pmax-column-header" align="left" bgcolor="#00AEEF">SEL_DC_MAX_POWER</td>
							<xsl:for-each select="pbmt/pbmt_entry">
								<td align='left'>
									<xsl:value-of select="sel_pmax"/>
								</td>
							</xsl:for-each>
						</tr>
						<tr>
							<th align="left" bgcolor="#00AEEF">Battery Participant</th>
							<td id="monitor-pbmt-table-participant-scope-column-header" align="left" bgcolor="#00AEEF"></td>
							<xsl:for-each select="pbmt/pbmt_entry">
								<td align='left'>
									<xsl:value-of select="battery_scope"/>
								</td>
							</xsl:for-each>
						</tr>
						<tr>
							<th align="left" bgcolor="#00AEEF">Battery Percentage Multiplier</th>
							<td id="monitor-pbmt-table-m_psoc-column-header" align="left" bgcolor="#00AEEF">M_PSOC</td>
							<xsl:for-each select="pbmt/pbmt_entry">
								<td align='left'>
									<xsl:value-of select="m_psoc"/>
								</td>
							</xsl:for-each>
						</tr>
						<tr>
							<th align="left" bgcolor="#00AEEF">Battery Percentage Coefficient (mW)</th>
							<td id="monitor-pbmt-table-c_psoc-column-header" align="left" bgcolor="#00AEEF">C_PSOC</td>
							<xsl:for-each select="pbmt/pbmt_entry">
								<td align='left'>
									<xsl:value-of select="c_psoc"/>
								</td>
							</xsl:for-each>
						</tr>
						<tr>
							<th align="left" bgcolor="#00AEEF">Use Lower Input Power Option</th>
							<td id="monitor-pbmt-table-sel_minmax-column-header" align="left" bgcolor="#00AEEF">SEL_MIN</td>
							<xsl:for-each select="pbmt/pbmt_entry">
								<td align='left'>
									<xsl:value-of select="sel_minmax"/>
								</td>
							</xsl:for-each>
						</tr>
						<tr>
							<th align="left" bgcolor="#00AEEF">Battery Power Multiplier 1 (%)</th>
							<td id="monitor-pbmt-table-m_bat1-column-header" align="left" bgcolor="#00AEEF">M_BAT1</td>
							<xsl:for-each select="pbmt/pbmt_entry">
								<td align='left'>
									<xsl:value-of select="m_bat1"/>
								</td>
							</xsl:for-each>
						</tr>
						<tr>
							<th align="left" bgcolor="#00AEEF">Battery Power Multiplier 2 (%)</th>
							<td id="monitor-pbmt-table-m_bat2-column-header" align="left" bgcolor="#00AEEF">M_BAT2</td>
							<xsl:for-each select="pbmt/pbmt_entry">
								<td align='left'>
									<xsl:value-of select="m_bat2"/>
								</td>
							</xsl:for-each>
						</tr>
						<tr>
							<th align="left" bgcolor="#00AEEF">ROP Multiplier (%)</th>
							<td id="monitor-pbmt-table-m_rop-column-header" align="left" bgcolor="#00AEEF">M_ROP</td>
							<xsl:for-each select="pbmt/pbmt_entry">
								<td align='left'>
									<xsl:value-of select="m_rop"/>
								</td>
							</xsl:for-each>
						</tr>
						<tr>
							<th align="left" bgcolor="#00AEEF">ROP Power (mW)</th>
							<td id="monitor-pbmt-table-rop_power-column-header" align="left" bgcolor="#00AEEF">ROP_POWER</td>
							<xsl:for-each select="pbmt/pbmt_entry">
								<td align='left'>
									<xsl:value-of select="prop"/>
								</td>
							</xsl:for-each>
						</tr>
						<tr>
							<th align="left" bgcolor="#00AEEF">ROP Power Coefficient (mW)</th>
							<td id="monitor-pbmt-table-c_rop_power-column-header" align="left" bgcolor="#00AEEF">C_ROP_POWER</td>
							<xsl:for-each select="pbmt/pbmt_entry">
								<td align='left'>
									<xsl:value-of select="c_prop"/>
								</td>
							</xsl:for-each>
						</tr>
						<tr>
							<th align="left" bgcolor="#00AEEF">Power Limit Multiplier (%)</th>
							<td id="monitor-pbmt-table-m_pl-column-header" align="left" bgcolor="#00AEEF">M_PL</td>
							<xsl:for-each select="pbmt/pbmt_entry">
								<td align='left'>
									<xsl:value-of select="m_pl"/>
								</td>
							</xsl:for-each>
						</tr>
						<tr>
							<th align="left" bgcolor="#00AEEF">Power Limit Coefficient (mW)</th>
							<td id="monitor-pbmt-table-c_pl-column-header" align="left" bgcolor="#00AEEF">C_PL</td>
							<xsl:for-each select="pbmt/pbmt_entry">
								<td align='left'>
									<xsl:value-of select="c_pl"/>
								</td>
							</xsl:for-each>
						</tr>
						<tr>
							<th align="left" bgcolor="#00AEEF">Maximum Calculated Power (mW)</th>
							<td id="monitor-pbmt-table-pl_max-column-header" align="left" bgcolor="#00AEEF">PL_MAX</td>
							<xsl:for-each select="pbmt/pbmt_entry">
								<td align='left'>
									<xsl:value-of select="pl_max"/>
								</td>
							</xsl:for-each>
						</tr>
						<tr>
							<th align="left" bgcolor="#00AEEF">Minimum Calculated Power (mW)</th>
							<td id="monitor-pbmt-table-pl_min-column-header" align="left" bgcolor="#00AEEF">PL_MIN</td>
							<xsl:for-each select="pbmt/pbmt_entry">
								<td align='left'>
									<xsl:value-of select="pl_min"/>
								</td>
							</xsl:for-each>
						</tr>
					</table>
					<br></br>
				</div>
			</xsl:if>

			<xsl:if test="count(math_function_calculator/entry_values) &gt; 0">
				<div style="float:right;">
					<table border="1" id="monitor-pb-math-calculation-history-table">
						<tr bgcolor="#00AEEF" colspan="29">
							<th colspan="29">Math Calculation History (in mW)</th>
						</tr>
						<tr>
							<th id="monitor-pb-math-calculation-history-table-variable-column-header" align="left" bgcolor="#00AEEF">Variable</th>
							<xsl:for-each select="math_function_calculator/entry_values">
								<xsl:choose>
									<xsl:when test="/power_boss_policy_status/active_action!=calculated_power_values/action_id">
										<td align="left"><xsl:value-of select="variable_id"/></td>
									</xsl:when>
									<xsl:otherwise>
										<td align="left" bgcolor="#FFFF99"><xsl:value-of select="variable_id"/></td>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:for-each>
						</tr>
						<tr>
							<th id="monitor-pb-math-calculation-history-table-ac_nominal_power-column-header" align="left" bgcolor="#00AEEF">AC Nominal Power</th>
							<xsl:for-each select="math_function_calculator/entry_values">
								<xsl:choose>
									<xsl:when test="/power_boss_policy_status/active_action!=calculated_power_values/action_id">
										<td align="left"><xsl:value-of select="calculated_power_values/ac_nominal_power"/></td>
									</xsl:when>
									<xsl:otherwise>
										<td align="left" bgcolor="#FFFF99"><xsl:value-of select="calculated_power_values/ac_nominal_power"/></td>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:for-each>
						</tr>
						<tr>
							<th id="monitor-pb-math-calculation-history-table-ac_power_1-column-header" align="left" bgcolor="#00AEEF">AC Power 1</th>
							<xsl:for-each select="math_function_calculator/entry_values">
								<xsl:choose>
									<xsl:when test="/power_boss_policy_status/active_action!=calculated_power_values/action_id">
										<td align="left"><xsl:value-of select="calculated_power_values/ac_power_1"/></td>
									</xsl:when>
									<xsl:otherwise>
										<td align="left" bgcolor="#FFFF99"><xsl:value-of select="calculated_power_values/ac_power_1"/></td>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:for-each>
						</tr>
						<tr>
							<th id="monitor-pb-math-calculation-history-table-ac_power_2-column-header" align="left" bgcolor="#00AEEF">AC Power 2</th>
							<xsl:for-each select="math_function_calculator/entry_values">
								<xsl:choose>
									<xsl:when test="/power_boss_policy_status/active_action!=calculated_power_values/action_id">
										<td align="left"><xsl:value-of select="calculated_power_values/ac_power_2"/></td>
									</xsl:when>
									<xsl:otherwise>
										<td align="left" bgcolor="#FFFF99"><xsl:value-of select="calculated_power_values/ac_power_2"/></td>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:for-each>
						</tr>
						<tr>
							<th id="monitor-pb-math-calculation-history-table-battery_power-column-header" align="left" bgcolor="#00AEEF">Battery Power</th>
							<xsl:for-each select="math_function_calculator/entry_values">
								<xsl:choose>
									<xsl:when test="/power_boss_policy_status/active_action!=calculated_power_values/action_id">
										<td align="left"><xsl:value-of select="calculated_power_values/battery_power"/></td>
									</xsl:when>
									<xsl:otherwise>
										<td align="left" bgcolor="#FFFF99"><xsl:value-of select="calculated_power_values/battery_power"/></td>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:for-each>
						</tr>
						<tr>
							<th id="monitor-pb-math-calculation-history-table-input_power-column-header" align="left" bgcolor="#00AEEF">Input Power</th>
							<xsl:for-each select="math_function_calculator/entry_values">
								<xsl:choose>
									<xsl:when test="/power_boss_policy_status/active_action!=calculated_power_values/action_id">
										<td align="left"><xsl:value-of select="calculated_power_values/input_power"/></td>
									</xsl:when>
									<xsl:otherwise>
										<td align="left" bgcolor="#FFFF99"><xsl:value-of select="calculated_power_values/input_power"/></td>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:for-each>
						</tr>
						<tr>
							<th id="monitor-pb-math-calculation-history-table-raw_output_power-column-header" align="left" bgcolor="#00AEEF">Raw Output Power</th>
							<xsl:for-each select="math_function_calculator/entry_values">
								<xsl:choose>
									<xsl:when test="/power_boss_policy_status/active_action!=calculated_power_values/action_id">
										<td align="left"><xsl:value-of select="calculated_power_values/raw_output_power"/></td>
									</xsl:when>
									<xsl:otherwise>
										<td align="left" bgcolor="#FFFF99"><xsl:value-of select="calculated_power_values/raw_output_power"/></td>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:for-each>
						</tr>
						<tr>
							<th id="monitor-pb-math-calculation-history-table-output_power-column-header" align="left" bgcolor="#00AEEF">Output Power</th>
							<xsl:for-each select="math_function_calculator/entry_values">
								<xsl:choose>
									<xsl:when test="/power_boss_policy_status/active_action!=calculated_power_values/action_id">
										<td align="left"><xsl:value-of select="calculated_power_values/output_power"/></td>
									</xsl:when>
									<xsl:otherwise>
										<td align="left" bgcolor="#FFFF99"><xsl:value-of select="calculated_power_values/output_power"/></td>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:for-each>
						</tr>
					</table>
					<br></br>
				</div>
			</xsl:if>

			<!-- Needed to re-align the following divs from the left of screen-->
			<div style="clear:both;"></div>

			<xsl:if test="count(vtmt/vtmt_entry) &gt; 0">
				<div style="float:left;">
					<table id="monitor-vtmt-table" border="1">
						<tr bgcolor="#00AEEF" colspan="142">
							<th colspan="142">Voltage Threshold Math Table (VTMT)</th>
						</tr>
						<tr>
							<th align="left" bgcolor="#00AEEF">Variable Name</th>
							<td id="monitor-vtmt-table-variable-column-header" align="left" bgcolor="#00AEEF">VARIABLE</td>
							<xsl:for-each select="vtmt/vtmt_entry">
								<td align='left'>
									<xsl:value-of select="variable"/>
								</td>
							</xsl:for-each>
						</tr>
						<tr>
							<th align="left" bgcolor="#00AEEF">Battery Participant</th>
							<td id="monitor-vtmt-table-participant-scope-column-header" align="left" bgcolor="#00AEEF"></td>
							<xsl:for-each select="vtmt/vtmt_entry">
								<td align='left'>
									<xsl:value-of select="battery_scope"/>
								</td>
							</xsl:for-each>
						</tr>
						<tr>
							<th align="left" bgcolor="#00AEEF">Use VBNL for No-Load Voltage</th>
							<td id="monitor-vtmt-table-sel_vbnl-column-header" align="left" bgcolor="#00AEEF">SEL_NO_LOAD_VOLTAGE</td>
							<xsl:for-each select="vtmt/vtmt_entry">
								<td align='left'>
									<xsl:value-of select="sel_no_load_voltage"/>
								</td>
							</xsl:for-each>
						</tr>
						<tr>
							<th align="left" bgcolor="#00AEEF">VBNL Multiplier</th>
							<td id="monitor-vtmt-table-m_v_bnl_soc-column-header" align="left" bgcolor="#00AEEF">M_V_BNL_SOC</td>
							<xsl:for-each select="vtmt/vtmt_entry">
								<td align='left'>
									<xsl:value-of select="m_v_bnl_soc"/>
								</td>
							</xsl:for-each>
						</tr>
						<tr>
							<th align="left" bgcolor="#00AEEF">VBNL Offset (mV)</th>
							<td id="monitor-vtmt-table-c_v_bnl_soc-column-header" align="left" bgcolor="#00AEEF">C_V_BNL_SOC</td>
							<xsl:for-each select="vtmt/vtmt_entry">
								<td align='left'>
									<xsl:value-of select="c_v_bnl_soc"/>
								</td>
							</xsl:for-each>
						</tr>
						<tr>
							<th align="left" bgcolor="#00AEEF">Use PMAX for Max Peak Power</th>
							<td id="monitor-vtmt-table-sel_pmax-column-header" align="left" bgcolor="#00AEEF">SEL_DC_MAX_POWER</td>
							<xsl:for-each select="vtmt/vtmt_entry">
								<td align='left'>
									<xsl:value-of select="sel_dc_max_power"/>
								</td>
							</xsl:for-each>
						</tr>
						<tr>
							<th align="left" bgcolor="#00AEEF">Battery Max Peak Power Multiplier</th>
							<td id="monitor-vtmt-table-m_p_bat_soc-column-header" align="left" bgcolor="#00AEEF">M_P_BAT_SOC</td>
							<xsl:for-each select="vtmt/vtmt_entry">
								<td align='left'>
									<xsl:value-of select="m_p_bat_soc"/>
								</td>
							</xsl:for-each>
						</tr>
						<tr>
							<th align="left" bgcolor="#00AEEF">Battery Max Peak Power Offset (mW)</th>
							<td id="monitor-vtmt-table-c_p_bat_soc-column-header" align="left" bgcolor="#00AEEF">C_P_BAT_SOC</td>
							<xsl:for-each select="vtmt/vtmt_entry">
								<td align='left'>
									<xsl:value-of select="c_p_bat_soc"/>
								</td>
							</xsl:for-each>
						</tr>
						<tr>
							<th align="left" bgcolor="#00AEEF">Battery Power Multiplier (%)</th>
							<td id="monitor-vtmt-table-m_p_bat-column-header" align="left" bgcolor="#00AEEF">M_P_BAT</td>
							<xsl:for-each select="vtmt/vtmt_entry">
								<td align='left'>
									<xsl:value-of select="m_p_bat"/>
								</td>
							</xsl:for-each>
						</tr>
						<tr>
							<th align="left" bgcolor="#00AEEF">Battery Power Offset (mW)</th>
							<td id="monitor-vtmt-table-c_p_bat-column-header" align="left" bgcolor="#00AEEF">C_P_BAT</td>
							<xsl:for-each select="vtmt/vtmt_entry">
								<td align='left'>
									<xsl:value-of select="c_p_bat"/>
								</td>
							</xsl:for-each>
						</tr>
						<tr>
							<th align="left" bgcolor="#00AEEF">Use AC_POWER Value</th>
							<td id="monitor-vtmt-table-sel_artg-column-header" align="left" bgcolor="#00AEEF">SEL_AC_POWER</td>
							<xsl:for-each select="vtmt/vtmt_entry">
								<td align='left'>
									<xsl:value-of select="sel_ac_power"/>
								</td>
							</xsl:for-each>
						</tr>
						<tr>
							<th align="left" bgcolor="#00AEEF">AC Power (mW)</th>
							<td id="monitor-vtmt-table-artg-column-header" align="left" bgcolor="#00AEEF">AC_POWER</td>
							<xsl:for-each select="vtmt/vtmt_entry">
								<td align='left'>
									<xsl:value-of select="ac_power"/>
								</td>
							</xsl:for-each>
						</tr>
						<tr>
							<th align="left" bgcolor="#00AEEF">AC Voltage (mV)</th>
							<td id="monitor-vtmt-table-avol-column-header" align="left" bgcolor="#00AEEF">AC_VOLTAGE</td>
							<xsl:for-each select="vtmt/vtmt_entry">
								<td align='left'>
									<xsl:value-of select="ac_voltage"/>
								</td>
							</xsl:for-each>
						</tr>
						<tr>
							<th align="left" bgcolor="#00AEEF">AC Current (mA)</th>
							<td id="monitor-vtmt-table-acur-column-header" align="left" bgcolor="#00AEEF">AC_CURRENT</td>
							<xsl:for-each select="vtmt/vtmt_entry">
								<td align='left'>
									<xsl:value-of select="ac_current"/>
								</td>
							</xsl:for-each>
						</tr>
						<tr>
							<th align="left" bgcolor="#00AEEF">AC Power Multiplier (%)</th>
							<td id="monitor-vtmt-table-m_p_ac-column-header" align="left" bgcolor="#00AEEF">M_P_AC</td>
							<xsl:for-each select="vtmt/vtmt_entry">
								<td align='left'>
									<xsl:value-of select="m_p_ac"/>
								</td>
							</xsl:for-each>
						</tr>
						<tr>
							<th align="left" bgcolor="#00AEEF">UVTH Upper Limit Offset (mV)</th>
							<td id="monitor-vtmt-table-c_uvth_max-column-header" align="left" bgcolor="#00AEEF">C_UVTH_MAX</td>
							<xsl:for-each select="vtmt/vtmt_entry">
								<td align='left'>
									<xsl:value-of select="c_uvth_max"/>
								</td>
							</xsl:for-each>
						</tr>
						<tr>
							<th align="left" bgcolor="#00AEEF">Platform UVTH Upper Limit (mV)</th>
							<td id="monitor-vtmt-table-plat_uvth_max-column-header" align="left" bgcolor="#00AEEF">PLAT_UVTH_MAX</td>
							<xsl:for-each select="vtmt/vtmt_entry">
								<td align='left'>
									<xsl:value-of select="plat_uvth_max"/>
								</td>
							</xsl:for-each>
						</tr>
						<tr>
							<th align="left" bgcolor="#00AEEF">Min VR Input Voltage (mV)</th>
							<td id="monitor-vtmt-table-v_sys_min-column-header" align="left" bgcolor="#00AEEF">V_SYS_MIN</td>
							<xsl:for-each select="vtmt/vtmt_entry">
								<td align='left'>
									<xsl:value-of select="v_sys_min"/>
								</td>
							</xsl:for-each>
						</tr>
						<tr>
							<th align="left" bgcolor="#00AEEF">Time Delta Before PROCHOT# (us)</th>
							<td id="monitor-vtmt-table-delta_time-column-header" align="left" bgcolor="#00AEEF">DELTA_TIME</td>
							<xsl:for-each select="vtmt/vtmt_entry">
								<td align='left'>
									<xsl:value-of select="delta_time"/>
								</td>
							</xsl:for-each>
						</tr>
						<tr>
							<th align="left" bgcolor="#00AEEF">VSys Rail Capacitance (uF)</th>
							<td id="monitor-vtmt-table-sys_cap-column-header" align="left" bgcolor="#00AEEF">SYS_CAP</td>
							<xsl:for-each select="vtmt/vtmt_entry">
								<td align='left'>
									<xsl:value-of select="sys_cap"/>
								</td>
							</xsl:for-each>
						</tr>
						<tr>
							<th align="left" bgcolor="#00AEEF">Battery High Frequency Impedance (mOhm)</th>
							<td id="monitor-vtmt-table-rbhf-column-header" align="left" bgcolor="#00AEEF">BAT_RESIST</td>
							<xsl:for-each select="vtmt/vtmt_entry">
								<td align='left'>
									<xsl:value-of select="bat_resist"/>
								</td>
							</xsl:for-each>
						</tr>
						<tr>
							<th align="left" bgcolor="#00AEEF">Rest of Platform Power (mW)</th>
							<td id="monitor-vtmt-table-rop_power-column-header" align="left" bgcolor="#00AEEF">ROP_POWER</td>
							<xsl:for-each select="vtmt/vtmt_entry">
								<td align='left'>
									<xsl:value-of select="rop_power"/>
								</td>
							</xsl:for-each>
						</tr>
						<tr>
							<th align="left" bgcolor="#00AEEF">Fast PROCHOT Multiplier (%)</th>
							<td id="monitor-vtmt-table-m_fph-column-header" align="left" bgcolor="#00AEEF">M_FPH</td>
							<xsl:for-each select="vtmt/vtmt_entry">
								<td align='left'>
									<xsl:value-of select="m_fph"/>
								</td>
							</xsl:for-each>
						</tr>
						<tr>
							<th align="left" bgcolor="#00AEEF">Fast PROCHOT Offset (mW)</th>
							<td id="monitor-vtmt-table-c_fph-column-header" align="left" bgcolor="#00AEEF">C_FPH</td>
							<xsl:for-each select="vtmt/vtmt_entry">
								<td align='left'>
									<xsl:value-of select="c_fph"/>
								</td>
							</xsl:for-each>
						</tr>
						<tr>
							<th align="left" bgcolor="#00AEEF">PL4 Multiplier 1 (%)</th>
							<td id="monitor-vtmt-table-m_pl4_1-column-header" align="left" bgcolor="#00AEEF">M_PL4_1</td>
							<xsl:for-each select="vtmt/vtmt_entry">
								<td align='left'>
									<xsl:value-of select="m_pl4_1"/>
								</td>
							</xsl:for-each>
						</tr>
						<tr>
							<th align="left" bgcolor="#00AEEF">PL4 Upper Limit (mW)</th>
							<td id="monitor-vtmt-table-pl4_max-column-header" align="left" bgcolor="#00AEEF">PL4_MAX</td>
							<xsl:for-each select="vtmt/vtmt_entry">
								<td align='left'>
									<xsl:value-of select="pl4_max"/>
								</td>
							</xsl:for-each>
						</tr>
						<tr>
							<th align="left" bgcolor="#00AEEF">PL4 Lower Limit (mW)</th>
							<td id="monitor-vtmt-table-pl4_min-column-header" align="left" bgcolor="#00AEEF">PL4_MIN</td>
							<xsl:for-each select="vtmt/vtmt_entry">
								<td align='left'>
									<xsl:value-of select="pl4_min"/>
								</td>
							</xsl:for-each>
						</tr>
						<tr>
							<th align="left" bgcolor="#00AEEF">PL4 Multiplier 2 (%)</th>
							<td id="monitor-vtmt-table-m_pl4_2-column-header" align="left" bgcolor="#00AEEF">M_PL4_2</td>
							<xsl:for-each select="vtmt/vtmt_entry">
								<td align='left'>
									<xsl:value-of select="m_pl4_2"/>
								</td>
							</xsl:for-each>
						</tr>
						<tr>
							<th align="left" bgcolor="#00AEEF">UVTH Lower Limit (mV)</th>
							<td id="monitor-vtmt-table-uvth_min-column-header" align="left" bgcolor="#00AEEF">UVTH_MIN</td>
							<xsl:for-each select="vtmt/vtmt_entry">
								<td align='left'>
									<xsl:value-of select="uvth_min"/>
								</td>
							</xsl:for-each>
						</tr>
					</table>
					<br></br>
				</div>
			</xsl:if>

			<xsl:if test="count(voltage_math_function_calculator/entry_values) &gt; 0">
				<div style="float:right;">
					<table border="1" id="monitor-pb-voltage-math-calculation-history-table">
						<tr bgcolor="#00AEEF" colspan="29">
							<th colspan="29">Voltage Threshold Math Calculation History</th>
						</tr>
						<tr>
							<th id="monitor-pb-voltage-math-calculation-history-table-variable-column-header" align="left" bgcolor="#00AEEF">Variable</th>
							<xsl:for-each select="voltage_math_function_calculator/entry_values">
								<xsl:choose>
									<xsl:when test="/power_boss_policy_status/active_action!=calculated_voltage_math_values/action_id">
										<td align="left"><xsl:value-of select="variable_id"/></td>
									</xsl:when>
									<xsl:otherwise>
										<td align="left" bgcolor="#FFFF99"><xsl:value-of select="variable_id"/></td>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:for-each>
						</tr>
						<tr>
							<th id="monitor-pb-voltage-math-calculation-history-table-vbnl-column-header" align="left" bgcolor="#00AEEF">No Load Voltage (in V)</th>
							<xsl:for-each select="voltage_math_function_calculator/entry_values">
								<xsl:choose>
									<xsl:when test="/power_boss_policy_status/active_action!=calculated_voltage_math_values/action_id">
										<td align="right"><xsl:value-of select="calculated_voltage_math_values/no_load_voltage"/></td>
									</xsl:when>
									<xsl:otherwise>
										<td align="right" bgcolor="#FFFF99"><xsl:value-of select="calculated_voltage_math_values/no_load_voltage"/></td>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:for-each>
						</tr>
						<tr>
							<th id="monitor-pb-voltage-math-calculation-history-table-raw_pbat_post_fph-column-header" align="left" bgcolor="#00AEEF">Raw Battery Power Post Fph (in W)</th>
							<xsl:for-each select="voltage_math_function_calculator/entry_values">
								<xsl:choose>
									<xsl:when test="/power_boss_policy_status/active_action!=calculated_voltage_math_values/action_id">
										<td align="right"><xsl:value-of select="calculated_voltage_math_values/raw_pbat_post_fph"/></td>
									</xsl:when>
									<xsl:otherwise>
										<td align="right" bgcolor="#FFFF99"><xsl:value-of select="calculated_voltage_math_values/raw_pbat_post_fph"/></td>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:for-each>
						</tr>
						<tr>
							<th id="monitor-pb-voltage-math-calculation-history-table-pbat_post_fph-column-header" align="left" bgcolor="#00AEEF">Battery Power Post Fph (in W)</th>
							<xsl:for-each select="voltage_math_function_calculator/entry_values">
								<xsl:choose>
									<xsl:when test="/power_boss_policy_status/active_action!=calculated_voltage_math_values/action_id">
										<td align="right"><xsl:value-of select="calculated_voltage_math_values/pbat_post_fph"/></td>
									</xsl:when>
									<xsl:otherwise>
										<td align="right" bgcolor="#FFFF99"><xsl:value-of select="calculated_voltage_math_values/pbat_post_fph"/></td>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:for-each>
						</tr>
						<tr>
							<th id="monitor-pb-voltage-math-calculation-history-table-raw_ac_power-column-header" align="left" bgcolor="#00AEEF">Raw AC Power (in W)</th>
							<xsl:for-each select="voltage_math_function_calculator/entry_values">
								<xsl:choose>
									<xsl:when test="/power_boss_policy_status/active_action!=calculated_voltage_math_values/action_id">
										<td align="right"><xsl:value-of select="calculated_voltage_math_values/raw_ac_power"/></td>
									</xsl:when>
									<xsl:otherwise>
										<td align="right" bgcolor="#FFFF99"><xsl:value-of select="calculated_voltage_math_values/raw_ac_power"/></td>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:for-each>
						</tr>
						<tr>
							<th id="monitor-pb-voltage-math-calculation-history-table-ac_power-column-header" align="left" bgcolor="#00AEEF">AC Power (in W)</th>
							<xsl:for-each select="voltage_math_function_calculator/entry_values">
								<xsl:choose>
									<xsl:when test="/power_boss_policy_status/active_action!=calculated_voltage_math_values/action_id">
										<td align="right"><xsl:value-of select="calculated_voltage_math_values/ac_power"/></td>
									</xsl:when>
									<xsl:otherwise>
										<td align="right" bgcolor="#FFFF99"><xsl:value-of select="calculated_voltage_math_values/ac_power"/></td>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:for-each>
						</tr>
						<tr>
							<th id="monitor-pb-voltage-math-calculation-history-table-uvth_max-column-header" align="left" bgcolor="#00AEEF">UVTH Max (in V)</th>
							<xsl:for-each select="voltage_math_function_calculator/entry_values">
								<xsl:choose>
									<xsl:when test="/power_boss_policy_status/active_action!=calculated_voltage_math_values/action_id">
										<td align="right"><xsl:value-of select="calculated_voltage_math_values/uvth_max"/></td>
									</xsl:when>
									<xsl:otherwise>
										<td align="right" bgcolor="#FFFF99"><xsl:value-of select="calculated_voltage_math_values/uvth_max"/></td>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:for-each>
						</tr>
						<tr>
							<th id="monitor-pb-voltage-math-calculation-history-table-first_numerator-column-header" align="left" bgcolor="#00AEEF">First Numerator</th>
							<xsl:for-each select="voltage_math_function_calculator/entry_values">
								<xsl:choose>
									<xsl:when test="/power_boss_policy_status/active_action!=calculated_voltage_math_values/action_id">
										<td align="right"><xsl:value-of select="calculated_voltage_math_values/first_numerator"/></td>
									</xsl:when>
									<xsl:otherwise>
										<td align="right" bgcolor="#FFFF99"><xsl:value-of select="calculated_voltage_math_values/first_numerator"/></td>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:for-each>
						</tr>
						<tr>
							<th id="monitor-pb-voltage-math-calculation-history-table-second_numerator-column-header" align="left" bgcolor="#00AEEF">Second Numerator</th>
							<xsl:for-each select="voltage_math_function_calculator/entry_values">
								<xsl:choose>
									<xsl:when test="/power_boss_policy_status/active_action!=calculated_voltage_math_values/action_id">
										<td align="right"><xsl:value-of select="calculated_voltage_math_values/second_numerator"/></td>
									</xsl:when>
									<xsl:otherwise>
										<td align="right" bgcolor="#FFFF99"><xsl:value-of select="calculated_voltage_math_values/second_numerator"/></td>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:for-each>
						</tr>
						<tr>
							<th id="monitor-pb-voltage-math-calculation-history-table-denominator-column-header" align="left" bgcolor="#00AEEF">Denominator</th>
							<xsl:for-each select="voltage_math_function_calculator/entry_values">
								<xsl:choose>
									<xsl:when test="/power_boss_policy_status/active_action!=calculated_voltage_math_values/action_id">
										<td align="right"><xsl:value-of select="calculated_voltage_math_values/denominator"/></td>
									</xsl:when>
									<xsl:otherwise>
										<td align="right" bgcolor="#FFFF99"><xsl:value-of select="calculated_voltage_math_values/denominator"/></td>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:for-each>
						</tr>
						<tr>
							<th id="monitor-pb-voltage-math-calculation-history-table-bat_max_peak_power_before_fph-column-header" align="left" bgcolor="#00AEEF">Battery Max Peak Power Before Fph (in W)</th>
							<xsl:for-each select="voltage_math_function_calculator/entry_values">
								<xsl:choose>
									<xsl:when test="/power_boss_policy_status/active_action!=calculated_voltage_math_values/action_id">
										<td align="right"><xsl:value-of select="calculated_voltage_math_values/bat_max_peak_power_before_fph"/></td>
									</xsl:when>
									<xsl:otherwise>
										<td align="right" bgcolor="#FFFF99"><xsl:value-of select="calculated_voltage_math_values/bat_max_peak_power_before_fph"/></td>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:for-each>
						</tr>
						<tr>
							<th id="monitor-pb-voltage-math-calculation-history-table-cpu_max_peak_power_before_fph-column-header" align="left" bgcolor="#00AEEF">CPU Max Peak Power Before Fph (in W)</th>
							<xsl:for-each select="voltage_math_function_calculator/entry_values">
								<xsl:choose>
									<xsl:when test="/power_boss_policy_status/active_action!=calculated_voltage_math_values/action_id">
										<td align="right"><xsl:value-of select="calculated_voltage_math_values/cpu_max_peak_power_before_fph"/></td>
									</xsl:when>
									<xsl:otherwise>
										<td align="right" bgcolor="#FFFF99"><xsl:value-of select="calculated_voltage_math_values/cpu_max_peak_power_before_fph"/></td>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:for-each>
						</tr>
						<tr>
							<th id="monitor-pb-voltage-math-calculation-history-table-cpu_peak_power_draw_post_fph-column-header" align="left" bgcolor="#00AEEF">CPU Peak Power Draw Post Fph (in W)</th>
							<xsl:for-each select="voltage_math_function_calculator/entry_values">
								<xsl:choose>
									<xsl:when test="/power_boss_policy_status/active_action!=calculated_voltage_math_values/action_id">
										<td align="right"><xsl:value-of select="calculated_voltage_math_values/cpu_peak_power_draw_post_fph"/></td>
									</xsl:when>
									<xsl:otherwise>
										<td align="right" bgcolor="#FFFF99"><xsl:value-of select="calculated_voltage_math_values/cpu_peak_power_draw_post_fph"/></td>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:for-each>
						</tr>
						<tr>
							<th id="monitor-pb-voltage-math-calculation-history-table-raw_cpu_peak_power_before_fph-column-header" align="left" bgcolor="#00AEEF">Raw CPU Peak Power Before Fph (in W)</th>
							<xsl:for-each select="voltage_math_function_calculator/entry_values">
								<xsl:choose>
									<xsl:when test="/power_boss_policy_status/active_action!=calculated_voltage_math_values/action_id">
										<td align="right"><xsl:value-of select="calculated_voltage_math_values/raw_cpu_peak_power_before_fph"/></td>
									</xsl:when>
									<xsl:otherwise>
										<td align="right" bgcolor="#FFFF99"><xsl:value-of select="calculated_voltage_math_values/raw_cpu_peak_power_before_fph"/></td>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:for-each>
						</tr>
						<tr>
							<th id="monitor-pb-voltage-math-calculation-history-table-cpu_peak_power_before_fph-column-header" align="left" bgcolor="#00AEEF">CPU Peak Power Before Fph (in W)</th>
							<xsl:for-each select="voltage_math_function_calculator/entry_values">
								<xsl:choose>
									<xsl:when test="/power_boss_policy_status/active_action!=calculated_voltage_math_values/action_id">
										<td align="right"><xsl:value-of select="calculated_voltage_math_values/cpu_peak_power_before_fph"/></td>
									</xsl:when>
									<xsl:otherwise>
										<td align="right" bgcolor="#FFFF99"><xsl:value-of select="calculated_voltage_math_values/cpu_peak_power_before_fph"/></td>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:for-each>
						</tr>
						<tr>
							<th id="monitor-pb-voltage-math-calculation-history-table-pl4_raw1-column-header" align="left" bgcolor="#00AEEF">PL4 Raw 1 (in W)</th>
							<xsl:for-each select="voltage_math_function_calculator/entry_values">
								<xsl:choose>
									<xsl:when test="/power_boss_policy_status/active_action!=calculated_voltage_math_values/action_id">
										<td align="right"><xsl:value-of select="calculated_voltage_math_values/pl4_raw1"/></td>
									</xsl:when>
									<xsl:otherwise>
										<td align="right" bgcolor="#FFFF99"><xsl:value-of select="calculated_voltage_math_values/pl4_raw1"/></td>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:for-each>
						</tr>
						<tr>
							<th id="monitor-pb-voltage-math-calculation-history-table-pl4_raw2-column-header" align="left" bgcolor="#00AEEF">PL4 Raw 2 (in W)</th>
							<xsl:for-each select="voltage_math_function_calculator/entry_values">
								<xsl:choose>
									<xsl:when test="/power_boss_policy_status/active_action!=calculated_voltage_math_values/action_id">
										<td align="right"><xsl:value-of select="calculated_voltage_math_values/pl4_raw2"/></td>
									</xsl:when>
									<xsl:otherwise>
										<td align="right" bgcolor="#FFFF99"><xsl:value-of select="calculated_voltage_math_values/pl4_raw2"/></td>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:for-each>
						</tr>
						<tr>
							<th id="monitor-pb-voltage-math-calculation-history-table-pl4_in_watts-column-header" align="left" bgcolor="#00AEEF">PL4 output (in W)</th>
							<xsl:for-each select="voltage_math_function_calculator/entry_values">
								<xsl:choose>
									<xsl:when test="/power_boss_policy_status/active_action!=calculated_voltage_math_values/action_id">
										<td align="right"><xsl:value-of select="calculated_voltage_math_values/pl4_in_watts"/></td>
									</xsl:when>
									<xsl:otherwise>
										<td align="right" bgcolor="#FFFF99"><xsl:value-of select="calculated_voltage_math_values/pl4_in_watts"/></td>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:for-each>
						</tr>
						<tr>
							<th id="monitor-pb-voltage-math-calculation-history-table-bat_peak_power_before_fph-column-header" align="left" bgcolor="#00AEEF">Battery Peak Power Before Fph (in W)</th>
							<xsl:for-each select="voltage_math_function_calculator/entry_values">
								<xsl:choose>
									<xsl:when test="/power_boss_policy_status/active_action!=calculated_voltage_math_values/action_id">
										<td align="right"><xsl:value-of select="calculated_voltage_math_values/bat_peak_power_before_fph"/></td>
									</xsl:when>
									<xsl:otherwise>
										<td align="right" bgcolor="#FFFF99"><xsl:value-of select="calculated_voltage_math_values/bat_peak_power_before_fph"/></td>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:for-each>
						</tr>
						<tr>
							<th id="monitor-pb-voltage-math-calculation-history-table-uvth_square_base-column-header" align="left" bgcolor="#00AEEF">UVTH Square Base</th>
							<xsl:for-each select="voltage_math_function_calculator/entry_values">
								<xsl:choose>
									<xsl:when test="/power_boss_policy_status/active_action!=calculated_voltage_math_values/action_id">
										<td align="right"><xsl:value-of select="calculated_voltage_math_values/uvth_square_base"/></td>
									</xsl:when>
									<xsl:otherwise>
										<td align="right" bgcolor="#FFFF99"><xsl:value-of select="calculated_voltage_math_values/uvth_square_base"/></td>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:for-each>
						</tr>
						<tr>
							<th id="monitor-pb-voltage-math-calculation-history-table-uvth_square-column-header" align="left" bgcolor="#00AEEF">UVTH Square</th>
							<xsl:for-each select="voltage_math_function_calculator/entry_values">
								<xsl:choose>
									<xsl:when test="/power_boss_policy_status/active_action!=calculated_voltage_math_values/action_id">
										<td align="right"><xsl:value-of select="calculated_voltage_math_values/uvth_square"/></td>
									</xsl:when>
									<xsl:otherwise>
										<td align="right" bgcolor="#FFFF99"><xsl:value-of select="calculated_voltage_math_values/uvth_square"/></td>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:for-each>
						</tr>
						<tr>
							<th id="monitor-pb-voltage-math-calculation-history-table-uvth_sqrt_param-column-header" align="left" bgcolor="#00AEEF">UVTH Square Root Param</th>
							<xsl:for-each select="voltage_math_function_calculator/entry_values">
								<xsl:choose>
									<xsl:when test="/power_boss_policy_status/active_action!=calculated_voltage_math_values/action_id">
										<td align="right"><xsl:value-of select="calculated_voltage_math_values/uvth_sqrt_param"/></td>
									</xsl:when>
									<xsl:otherwise>
										<td align="right" bgcolor="#FFFF99"><xsl:value-of select="calculated_voltage_math_values/uvth_sqrt_param"/></td>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:for-each>
						</tr>
						<tr>
							<th id="monitor-pb-voltage-math-calculation-history-table-uvth_sqrt-column-header" align="left" bgcolor="#00AEEF">UVTH Square Root</th>
							<xsl:for-each select="voltage_math_function_calculator/entry_values">
								<xsl:choose>
									<xsl:when test="/power_boss_policy_status/active_action!=calculated_voltage_math_values/action_id">
										<td align="right"><xsl:value-of select="calculated_voltage_math_values/uvth_sqrt"/></td>
									</xsl:when>
									<xsl:otherwise>
										<td align="right" bgcolor="#FFFF99"><xsl:value-of select="calculated_voltage_math_values/uvth_sqrt"/></td>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:for-each>
						</tr>
						<tr>
							<th id="monitor-pb-voltage-math-calculation-history-table-raw_uvth-column-header" align="left" bgcolor="#00AEEF">Raw UVTH (in V)</th>
							<xsl:for-each select="voltage_math_function_calculator/entry_values">
								<xsl:choose>
									<xsl:when test="/power_boss_policy_status/active_action!=calculated_voltage_math_values/action_id">
										<td align="right"><xsl:value-of select="calculated_voltage_math_values/raw_uvth"/></td>
									</xsl:when>
									<xsl:otherwise>
										<td align="right" bgcolor="#FFFF99"><xsl:value-of select="calculated_voltage_math_values/raw_uvth"/></td>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:for-each>
						</tr>
						<tr>
							<th id="monitor-pb-voltage-math-calculation-history-table-uvth_snapped_to_max-column-header" align="left" bgcolor="#00AEEF">UVTH Snapped to Max (in V)</th>
							<xsl:for-each select="voltage_math_function_calculator/entry_values">
								<xsl:choose>
									<xsl:when test="/power_boss_policy_status/active_action!=calculated_voltage_math_values/action_id">
										<td align="right"><xsl:value-of select="calculated_voltage_math_values/uvth_snapped_to_max"/></td>
									</xsl:when>
									<xsl:otherwise>
										<td align="right" bgcolor="#FFFF99"><xsl:value-of select="calculated_voltage_math_values/uvth_snapped_to_max"/></td>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:for-each>
						</tr>
						<tr>
							<th id="monitor-pb-voltage-math-calculation-history-table-uvth_in_volts-column-header" align="left" bgcolor="#00AEEF">UVTH output (in V)</th>
							<xsl:for-each select="voltage_math_function_calculator/entry_values">
								<xsl:choose>
									<xsl:when test="/power_boss_policy_status/active_action!=calculated_voltage_math_values/action_id">
										<td align="right"><xsl:value-of select="calculated_voltage_math_values/uvth_in_volts"/></td>
									</xsl:when>
									<xsl:otherwise>
										<td align="right" bgcolor="#FFFF99"><xsl:value-of select="calculated_voltage_math_values/uvth_in_volts"/></td>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:for-each>
						</tr>
					</table>
					<br></br>
				</div>
			</xsl:if>
			
			<!-- Needed to re-align the following divs from the left of screen-->
			<div style="clear:both;"></div>
			<div style="float:left;">
				<table border="1" id="monitor-pb-conditions-table">
					<tr bgcolor="#00AEEF" colspan="6">
						<th colspan="6">Conditions</th>
					</tr>
					<tr id="monitor-pb-conditions-table-header-row" bgcolor="#00AEEF">
						<th>Type</th>
						<th>Participant</th>
						<th>Domain Type</th>
						<th>Last Known Value</th>
						<th>Is Supported</th>
						<th>Is In PBCT</th>
					</tr>
					<xsl:for-each select="conditions_directory/condition">
						<xsl:choose>
							<xsl:when test="is_valid='false'">
								<tr>
									<td align='center' bgcolor="#FF7F7F"><xsl:value-of select="condition_type"/></td>
									<td align='center' bgcolor="#FF7F7F"><xsl:value-of select="participant_scope"/> (<xsl:value-of select="participant_index"/>)</td>
									<td align='center' bgcolor="#FF7F7F"><xsl:value-of select="domain_type"/> (<xsl:value-of select="domain_index"/>)</td>
									<td align='center' bgcolor="#FF7F7F"><xsl:value-of select="current_value"/></td>
									<td align='center' bgcolor="#FF7F7F"><xsl:value-of select="is_valid"/></td>
									<td align='center' bgcolor="#FF7F7F"><xsl:value-of select="is_in_use"/></td>
								</tr>
							</xsl:when>
							<xsl:otherwise>
								<xsl:choose>
									<xsl:when test="is_in_use='true'">
										<tr>
											<td align='center' bgcolor="#99E799"><xsl:value-of select="condition_type"/></td>
											<td align='center' bgcolor="#99E799"><xsl:value-of select="participant_scope"/> (<xsl:value-of select="participant_index"/>)</td>
											<td align='center' bgcolor="#99E799"><xsl:value-of select="domain_type"/> (<xsl:value-of select="domain_index"/>)</td>
											<td align='center' bgcolor="#99E799"><xsl:value-of select="current_value"/></td>
											<td align='center' bgcolor="#99E799"><xsl:value-of select="is_valid"/></td>
											<td align='center' bgcolor="#99E799"><xsl:value-of select="is_in_use"/></td>
										</tr>
									</xsl:when>
									<xsl:otherwise>
										<tr>
											<td align='center'><xsl:value-of select="condition_type"/></td>
											<td align='center'><xsl:value-of select="participant_scope"/> (<xsl:value-of select="participant_index"/>)</td>
											<td align='center'><xsl:value-of select="domain_type"/> (<xsl:value-of select="domain_index"/>)</td>
											<td align='center'><xsl:value-of select="current_value"/></td>
											<td align='center'><xsl:value-of select="is_valid"/></td>
											<td align='center'><xsl:value-of select="is_in_use"/></td>
										</tr>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:for-each>
				</table>
			</div>

			<div style="float:right;">
				<table border="1" id="monitor-pb-battery-tracker-table">
				<tr bgcolor="#00AEEF" colspan="4">
					<th colspan="4">Aggregate Battery Status</th>
				</tr>
				<tr>
					<th id="monitor-pb-battery-tracker-table-aggregate_battery_state-column-header" align="left" bgcolor="#00AEEF">Aggregate Battery State</th>
					<td align="center"><xsl:value-of select="battery_tracker/aggregate_battery_state"/></td>
				</tr>
				<tr>
					<th id="monitor-pb-battery-tracker-table-aggregate_battery_remaining_capacity-column-header" align="left" bgcolor="#00AEEF">Aggregate Battery Remaining Capacity</th>
					<td align="center"><xsl:value-of select="battery_tracker/aggregate_battery_remaining_capacity"/></td>
				</tr>
				<tr>
					<th id="monitor-pb-battery-tracker-table-aggregate_battery_design_capacity-column-header" align="left" bgcolor="#00AEEF">Aggregate Battery Design Capacity</th>
					<td align="center"><xsl:value-of select="battery_tracker/aggregate_battery_design_capacity"/></td>
				</tr>
				<tr>
					<th id="monitor-pb-battery-tracker-table-aggregate_battery_last_full_charge_capacity-column-header" align="left" bgcolor="#00AEEF">Aggregate Battery Last Full Charge Capacity</th>
					<td align="center"><xsl:value-of select="battery_tracker/aggregate_battery_last_full_charge_capacity"/></td>
				</tr>
				<tr bgcolor="#00AEEF" colspan="4">
					<th colspan="4">Battery Tracker Status</th>
				</tr>
				<tr>
					<th id="monitor-pb-battery-tracker-table-battery_name-column-header" align="left" bgcolor="#00AEEF">Battery Name</th>
					<xsl:for-each select="battery_tracker/battery">
						<td align="center"><xsl:value-of select="battery_name"/></td>
					</xsl:for-each>
				</tr>
				<tr>
					<th id="monitor-pb-battery-tracker-table-battery_used_in_calc-column-header" align="left" bgcolor="#00AEEF">Used In Aggregate Calculations</th>
					<xsl:for-each select="battery_tracker/battery">
						<xsl:choose>
							<xsl:when test="battery_used_in_calc='false'">
								<td align="center" bgcolor="#FF7F7F"><xsl:value-of select="battery_used_in_calc"/></td>
							</xsl:when>
							<xsl:otherwise>
								<td align="center" bgcolor="#99E799"><xsl:value-of select="battery_used_in_calc"/></td>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:for-each>
				</tr>
				<tr>
					<th id="monitor-pb-battery-tracker-table-battery_percentage-column-header" align="left" bgcolor="#00AEEF">Battery Percentage</th>
					<xsl:for-each select="battery_tracker/battery">
						<td align="center"><xsl:value-of select="battery_percentage"/></td>
					</xsl:for-each>
				</tr>
				<tr>
					<th id="monitor-pb-battery-tracker-table-battery_state-column-header" align="left" bgcolor="#00AEEF">Battery State</th>
					<xsl:for-each select="battery_tracker/battery/battery_status">
						<td align="center"><xsl:value-of select="battery_state"/></td>
					</xsl:for-each>
				</tr>
				<tr>
					<th id="monitor-pb-battery-tracker-table-present_rate-column-header" align="left" bgcolor="#00AEEF">Battery Present Rate</th>
					<xsl:for-each select="battery_tracker/battery/battery_status">
						<td align="center"><xsl:value-of select="present_rate"/></td>
					</xsl:for-each>
				</tr>
				<tr>
					<th id="monitor-pb-battery-tracker-table-remaining_capacity-column-header" align="left" bgcolor="#00AEEF">Battery Remaining Capacity</th>
					<xsl:for-each select="battery_tracker/battery/battery_status">
						<td align="center"><xsl:value-of select="remaining_capacity"/></td>
					</xsl:for-each>
				</tr>
				<tr>
					<th id="monitor-pb-battery-tracker-table-present_voltage-column-header" align="left" bgcolor="#00AEEF">Battery Present Voltage</th>
					<xsl:for-each select="battery_tracker/battery/battery_status">
						<td align="center"><xsl:value-of select="present_voltage"/></td>
					</xsl:for-each>
				</tr>
				<tr>
					<th id="monitor-pb-battery-tracker-table-cycle_count-column-header" align="left" bgcolor="#00AEEF">Battery Cycle Count</th>
					<xsl:for-each select="battery_tracker/battery/battery_information">
						<td align="center"><xsl:value-of select="cycle_count"/></td>
					</xsl:for-each>
				</tr>
				<tr>
					<th id="monitor-pb-battery-tracker-table-last_full_charge_capacity-column-header" align="left" bgcolor="#00AEEF">Battery Last Full Charge Capacity</th>
					<xsl:for-each select="battery_tracker/battery/battery_information">
						<td align="center"><xsl:value-of select="last_full_charge_capacity"/></td>
					</xsl:for-each>
				</tr>
				<tr>
					<th id="monitor-pb-battery-tracker-table-design_capacity-column-header" align="left" bgcolor="#00AEEF">Battery Design Capacity</th>
					<xsl:for-each select="battery_tracker/battery/battery_information">
						<td align="center"><xsl:value-of select="design_capacity"/></td>
					</xsl:for-each>
				</tr>
				</table>
			</div>
		<!-- Needed to re-align the following divs from the left of screen-->
		<div style="clear:both;"></div>
		</xsl:template>
</xsl:stylesheet>
<!-- end xsl -->

<!-- begin xsl -->
<?xml version="1.0" encoding="ISO-8859-1"?>
<!-- format_id=2F-96-49-53-E6-71-1D-43-9A-E8-0A-63-5B-71-0A-EE -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/emergency_call_mode_policy_status">

		<table border="1" id="monitor-emergency-call-status-table">
			<tr id="monitor-emergency-call-status-table-header-row" bgcolor="#00AEEF">
				<th align='left'>Emergency Call in Progress</th>
			</tr>
			<tr>
				<td align='left'>
					<xsl:value-of select="emergency_status"/>
				</td>
			</tr>
		</table>

		<br></br>
		
		<table id="monitor-ecmt-table" border="1">
			<tr bgcolor="#00AEEF" colspan="5">
				<th colspan="5">Emergency Call Mode Table (ECMT)</th>
			</tr>
			<tr id="monitor-ecmt-table-header-row" bgcolor="#00AEEF">
				<th align='left'>Device Scope</th>
				<th align='left'>Domain</th>
				<th align='left'>Control Knob</th>
				<th align='right'>Min Value (reserved)</th>
				<th align='right'>Max Value (reserved)</th>
			</tr>
			<xsl:for-each select="ecmt/ecmt_entry">
				<tr>
					<td align='left'>
						<xsl:value-of select="device_scope"/> (<xsl:value-of select="device_index"/>)
					</td>
					<td align='left'>
						<xsl:value-of select="domain_type"/> (<xsl:value-of select="domain_index"/>)
					</td>
					<td align='left'>
						<xsl:value-of select="control_knob"/>
					</td>
					<td align='right'>
						<xsl:value-of select="min_value"/>
					</td>
					<td align='right'>
						<xsl:value-of select="max_value"/>
					</td>
				</tr>
			</xsl:for-each>
		</table>
	</xsl:template>
</xsl:stylesheet>
<!-- end xsl -->

<!-- begin xsl -->
<?xml version="1.0" encoding="ISO-8859-1"?>
<!-- format_id=14-6E-49-42-1B-BC-E8-46-A7-98-CA-91-54-64-42-6F -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/pid_policy_status">

		<div>
			<div>
			<table border="1" id="monitor-pid-targets-table">
				<tr bgcolor="#00AEEF" colspan="10">
					<th colspan="10">Targets</th>
				</tr>
				<tr id="monitor-pid-targets-table-header-row" bgcolor="#00AEEF">
					<th align='center' style='max-width:80px; min-width:80px;'>Target</th>
					<th align='center' style='max-width:80px; min-width:80px;'>Monitored</th>
					<th align='center' style='max-width:80px; min-width:80px;'>Resume Time</th>
					<th align='center' style='max-width:80px; min-width:80px;'>Aux0</th>
					<th align='center' style='max-width:80px; min-width:80px;'>Current Temp</th>
					<th align='center' style='max-width:80px; min-width:80px;'>Aux1</th>
					<th align='center' style='max-width:80px; min-width:80px;'>Source</th>
					<th align='center' style='max-width:80px; min-width:80px;'>Domain</th>
					<th align='center' style='max-width:220px; min-width:220px;'>Control Knob</th>
					<th align='center' style='max-width:80px; min-width:80px;'>Requested Value</th>
				</tr>
				<xsl:for-each select="target_directory/target">
					<tr>
						<td><xsl:value-of select="target_name"/> (<xsl:value-of select="target_index"/>)</td>
						<td align='center'><xsl:value-of select="is_monitored"/></td>
						<td align='center'><xsl:value-of select="participant_callback/time_until_expires"/></td>
						<td align='center'><xsl:value-of select="temperature_thresholds/aux0"/></td>
						<td align='center'><xsl:value-of select="current_temperature"/></td>
						<td align='center'><xsl:value-of select="temperature_thresholds/aux1"/></td>
						<td colspan='4'>
							<xsl:variable name="part-name">
								<xsl:value-of select="target_name"/>
							</xsl:variable>
							<table border="1" id="monitor-pid-target-request-table-{$part-name}">
								<xsl:for-each select="requests/request">
									<tr>
										<td align='center' style='max-width:80px; min-width:80px;'><xsl:value-of select="source_name"/>(<xsl:value-of select="source_index"/>)</td>
										<td align='center' style='max-width:80px; min-width:80px;'><xsl:value-of select="domain_name"/>(<xsl:value-of select="domain_index"/>)</td>
										<td align='center' style='max-width:220px; min-width:220px;'><xsl:value-of select="control_knob"/></td>
										<td align='center' style='max-width:80px; min-width:80px;'><xsl:value-of select="requested_value"/></td>
									</tr>
								</xsl:for-each>
							</table>
						</td>
					</tr>
				</xsl:for-each>
			</table>
		</div>

		<br></br>
		
		<div style="width: 1188px">
			<table border="1" style="float: right;" id="monitor-pid-sources-table">
				<tr bgcolor="#00AEEF" colspan="8">
					<th colspan="8">Sources</th>
				</tr>
				<tr id="monitor-pid-sources-table-header-row" bgcolor="#00AEEF">
					<th align='center'>Source</th>
					<th align='center'>Domain</th>
					<th align='center'>Is Being Controlled</th>
					<th align='center'>Resume Time</th>
					<th align='center' style='max-width:90px; min-width:90px;'>Max</th>
					<th align='center' style='max-width:90px; min-width:90px;'>Requested Value</th>
					<th align='center' style='max-width:90px; min-width:90px;'>Min</th>
					<th align='center' style='max-width:90px; min-width:90px;'>Granted Value</th>
				</tr>
				<xsl:for-each select="source_directory/source_control">
					<tr>
						<td><xsl:value-of select="source_name"/> (<xsl:value-of select="source_index"/>)</td>
						<td><xsl:value-of select="domain_name"/> (<xsl:value-of select="domain_index"/>)</td>
						<td align='center'><xsl:value-of select="is_being_controlled"/></td>
						<td align='center'><xsl:value-of select="participant_callback/time_until_expires"/></td>
						<td align='center'><xsl:value-of select="max"/></td>
						<xsl:choose>
							<xsl:when test="val!=idle">
								<td align='center' bgcolor="#FFFF99"><xsl:value-of select="val"/></td>
							</xsl:when>
							<xsl:otherwise>
								<td align='center'><xsl:value-of select="val"/></td>
							</xsl:otherwise>
						</xsl:choose>
						<td align='center'><xsl:value-of select="min"/></td>
						<xsl:choose>
							<xsl:when test="granted!=idle">
								<td align='center' bgcolor="#FFFF99"><xsl:value-of select="granted"/></td>
							</xsl:when>
							<xsl:otherwise>
								<td align='center'><xsl:value-of select="granted"/></td>
							</xsl:otherwise>
						</xsl:choose>
					</tr>
				</xsl:for-each>
			</table>

			<table border="1" style="float: left;" id="monitor-pid-trip-point-statistics-table">
				<tr bgcolor="#00AEEF" colspan="3">
					<th colspan="3">Trip Point Statistics</th>
				</tr>
				<tr id="monitor-pid-trip-point-statistics-table-header-row" bgcolor="#00AEEF">
					<th align='center' style='max-width:80px; min-width:80px;'>Target</th>
					<th align='center' style='max-width:80px; min-width:80px;'>Time</th>
					<th align='center' style='max-width:80px; min-width:80px;'>Temp</th>
				</tr>
				<xsl:for-each select="trip_point_statistics/participant_trip_point_statistics">
					<xsl:if test="supports_trip_points='true'">
						<tr>
							<td>
								<xsl:value-of select="participant_name"/> (<xsl:value-of select="participant_index"/>)
							</td>
							<td align='center'>
								<xsl:value-of select="time_since_last_trip"/>
							</td>
							<td align='center'>
								<xsl:value-of select="temperature_of_last_trip"/>
							</td>
						</tr>
					</xsl:if>
				</xsl:for-each>
			</table>
		</div>

		<div style="clear: both;"></div>
		<br></br>

		<div>
		<table id="monitor-pida-table" border="1">
			<tr bgcolor="#00AEEF" colspan="12">
				<th colspan="12">PID Algorithm Table (PIDA)</th>
			</tr>
			<tr id="monitor-pida-table-header-row" bgcolor="#00AEEF">
				<th align='center'>Source</th>
				<th align='center'>Domain</th>
				<th align='center'>Control Knob</th>
				<th align='center'>Target</th>
				<th align='center' width='60px'>Trip Point Temperature</th>
				<th align='center' width='60px'>Target Temperature</th>
				<th align='center' width='60px'>Deadband</th>
				<th align='center' width='60px'>Sample Period (s)</th>
				<th align='center' width='60px'>Kp</th>
				<th align='center' width='60px'>Ki</th>
				<th align='center' width='60px'>Kd</th>
				<th align='center' width='60px'>Initial Output</th>
			</tr>
			<xsl:for-each select="pida/pida_entry">
				<tr>
					<td align='left'><xsl:value-of select="source_device_scope"/> (<xsl:value-of select="source_index"/>)</td>
					<td align='left'><xsl:value-of select="source_domain"/> (<xsl:value-of select="source_domain_index"/>)</td>
					<td align='left'><xsl:value-of select="control_knob"/></td>
					<td align='left'><xsl:value-of select="target_device_scope"/> (<xsl:value-of select="target_index"/>)</td>
					<td align='center'><xsl:value-of select="trip_point_temperature"/></td>
					<td align='center'><xsl:value-of select="target_temperature"/></td>
					<td align='center'><xsl:value-of select="deadband"/></td>
					<td align='center'><xsl:value-of select="sampling_period"/></td>
					<td align='center'><xsl:value-of select="kp"/></td>
					<td align='center'><xsl:value-of select="ki"/></td>
					<td align='center'><xsl:value-of select="kd"/></td>
					<td align='center'><xsl:value-of select="initial_output"/></td>
				</tr>
			</xsl:for-each>
		</table>
		</div>
	</div>
		
	</xsl:template>
</xsl:stylesheet>
<!-- end xsl -->

<!-- begin xsl -->
<?xml version="1.0" encoding="ISO-8859-1"?>
<!-- format_id=B6-FA-56-0E-FC-BD-8C-4E-82-46-40-EC-FD-4D-74-EA -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/active_policy2_status">

	<div>
		<div>
		 <table border="1" id="monitor-active2-targets-table">
			 <tr bgcolor="#00AEEF" colspan="11">
				 <th colspan="11">Targets</th>
			 </tr>
			 <tr id="monitor-active2-targets-table-header-row" bgcolor="#00AEEF">
				<th align='left' style='max-width:80px; min-width:80px;'>Target</th>
				<th align='left' style='max-width:80px; min-width:80px;'>Monitored</th>
				<th align='right' style='max-width:80px; min-width:80px;'>Resume Time</th>
				<th align='right' style='max-width:80px; min-width:80px;'>Aux0</th>
				<th align='right' style='max-width:80px; min-width:80px;'>Current Temp</th>
				<th align='right' style='max-width:80px; min-width:80px;'>Aux1</th>
				<th align='right' style='max-width:80px; min-width:80px;'>Hysteresis</th>
				<th align='center' style='max-width:80px; min-width:80px;'>Source</th>
				<th align='center' style='max-width:90px; min-width:90px;'>Requested Value (%)</th>
				<th align='center' style='max-width:220px; min-width:220px;'>Control Knob</th>
				<th align='center' style='max-width:90px; min-width:90px;'>Preferred Value</th>
			</tr>
			<xsl:for-each select="target_directory/target">
				<tr>
					<td><xsl:value-of select="target_name"/> (<xsl:value-of select="target_index"/>)</td>
					<td><xsl:value-of select="is_monitored"/></td>
					<td><xsl:value-of select="participant_callback/time_until_expires"/></td>
					<td align='right'><xsl:value-of select="temperature_thresholds/aux0"/></td>
					<td align='right'><xsl:value-of select="current_temperature"/></td>
					<td align='right'><xsl:value-of select="temperature_thresholds/aux1"/></td>
					<td align='right'><xsl:value-of select="temperature_thresholds/hysteresis"/></td>
					<td colspan='4'>
						<xsl:variable name="part-name">
							<xsl:value-of select="target_name"/>
						</xsl:variable>
						<table border="1" style="width:100%" id="monitor-active2-target-requests-table-{$part-name}">
							 <xsl:for-each select="requests/request">
									<tr>
										<td align='center' style='max-width:80px; min-width:80px;'><xsl:value-of select="source_name"/>(<xsl:value-of select="source_index"/>)</td>
										<td align='center' style='max-width:90px; min-width:90px;'><xsl:value-of select="requested_value"/></td>
										<td align='center' style='max-width:220px; min-width:220px;'><xsl:value-of select="control_knob"/></td>
										<td align='center' style='max-width:90px; min-width:90px;'><xsl:value-of select="preferred_value"/></td>
									</tr>
							 </xsl:for-each>
					 </table>
					</td>
				</tr>
			</xsl:for-each>
		 </table>
		</div>

<br></br>

	 <div style="width: 1188px">
		 <table border="1" style="float: right;" id="monitor-active2-sources-table">
				<tr bgcolor="#00AEEF" colspan="9">
					<th colspan="9">Sources</th>
				</tr>
			 <tr id="monitor-active2-sources-table-header-row" bgcolor="#00AEEF">
					<th align='center'>Source</th>
					<th align='center'>Is Being Controlled</th>
					<th align='center'>Resume Time</th>
					<th align='center' style='max-width:90px; min-width:90px;'>Max</th>
					<th align='center' style='max-width:90px; min-width:90px;'>Requested Value (%)</th>
					<th align='center' style='max-width:90px; min-width:90px;'>Requested Value (RPM)</th>
					<th align='center' style='max-width:90px; min-width:90px;'>Min</th>
					<th align='center' style='max-width:90px; min-width:90px;'>Granted Value (%)</th>
					<th align='center' style='max-width:90px; min-width:90px;'>Granted Value (RPM)</th>
				</tr>
				<xsl:for-each select="source_directory/source">
					<tr>
					 <xsl:choose>
						<xsl:when test="hasValidFpsTable!='false'">
						<td><xsl:value-of select="source_name"/> (<xsl:value-of select="source_index"/>)</td>
						<td align='center'><xsl:value-of select="is_being_controlled"/></td>
						<td align='center'><xsl:value-of select="participant_callback/time_until_expires"/></td>
						<td align='center'><xsl:value-of select="max"/></td>
						<xsl:choose>
							<xsl:when test="is_being_controlled!='false'">
								<td align='center' bgcolor="#FFFF99"><xsl:value-of select="val"/></td>
							</xsl:when>
							<xsl:otherwise>
								<td align='center'><xsl:value-of select="val"/></td>
							</xsl:otherwise>
						</xsl:choose>
						<xsl:choose>
							<xsl:when test="requestedSpeedInRPM!='X' and requestedSpeedInRPM!=min">
								<td align='center' bgcolor="#FFFF99"><xsl:value-of select="requestedSpeedInRPM"/></td>
							</xsl:when>
							<xsl:otherwise>
								<td align='center'><xsl:value-of select="requestedSpeedInRPM"/></td>
							</xsl:otherwise>
						</xsl:choose>
						<td align='center'><xsl:value-of select="min"/></td>
						<xsl:choose>
							<xsl:when test="is_being_controlled!='false'">
								<td align='center' bgcolor="#FFFF99"><xsl:value-of select="granted"/></td>
							</xsl:when>
							<xsl:otherwise>
								<td align='center'><xsl:value-of select="granted"/></td>
							</xsl:otherwise>
						</xsl:choose>
						<xsl:choose>
							<xsl:when test="grantedInRPM!='X' and grantedInRPM!=min">
								<td align='center' bgcolor="#FFFF99"><xsl:value-of select="grantedInRPM"/></td>
							</xsl:when>
							<xsl:otherwise>
								<td align='center'><xsl:value-of select="grantedInRPM"/></td>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:when>
					<xsl:otherwise>
						<td bgcolor="#FF0000"><xsl:value-of select="source_name"/> (<xsl:value-of select="source_index"/>)</td>
						<td align='center' bgcolor="#FF0000"><xsl:value-of select="is_being_controlled"/></td>
						<td align='center' bgcolor="#FF0000"><xsl:value-of select="participant_callback/time_until_expires"/></td>
						<td align='center' bgcolor="#FF0000"><xsl:value-of select="max"/></td>
						<td align='center' bgcolor="#FF0000"><xsl:value-of select="val"/></td>
						<td align='center' bgcolor="#FF0000"><xsl:value-of select="requestedSpeedInRPM"/></td>
						<td align='center' bgcolor="#FF0000"><xsl:value-of select="min"/></td>
						<td align='center' bgcolor="#FF0000"><xsl:value-of select="granted"/></td>
						<td align='center' bgcolor="#FF0000"><xsl:value-of select="grantedInRPM"/></td>
					</xsl:otherwise>
				 </xsl:choose>
				</tr>
			 </xsl:for-each>
			</table>

		<table border="1" style="float: left;" id="monitor-active2-trip-point-statistics-table">
			<tr bgcolor="#00AEEF" colspan="3">
				<th colspan="3">Trip Point Statistics</th>
			</tr>
			<tr id="monitor-active2-trip-point-statistics-table-header-row" bgcolor="#00AEEF">
				<th align='left' style='max-width:80px; min-width:80px;'>Target</th>
				<th align='right' style='max-width:80px; min-width:80px;'>Time</th>
				<th align='right' style='max-width:80px; min-width:80px;'>Temp</th>
			</tr>
			<xsl:for-each select="trip_point_statistics/participant_trip_point_statistics">
				<xsl:if test="supports_trip_points='true'">
					<tr>
						<td>
							<xsl:value-of select="participant_name"/> (<xsl:value-of select="participant_index"/>)
						</td>
						<td align='right'>
							<xsl:value-of select="time_since_last_trip"/>
						</td>
						<td align='right'>
							<xsl:value-of select="temperature_of_last_trip"/>
						</td>
					</tr>
				</xsl:if>
			</xsl:for-each>
		</table>
	 </div>

		<div style="clear: both;"></div>
		<br></br>

		<div>
			<xsl:variable name="table-mode">
				<xsl:value-of select="acpr/control_mode"/>
			</xsl:variable>
		<table id="monitor-acpr-table" border="1" mode="{$table-mode}">
			<tr bgcolor="#00AEEF" colspan="7">
				<xsl:if test="acpr/control_mode">
					<th colspan="7">Active Control Point Relationship Table (ACPR) (<xsl:value-of select="acpr/control_mode"/>)</th>
				</xsl:if>
				<xsl:if test="not(acpr/control_mode)">
					<th colspan="7">Active Control Point Relationship Table (ACPR)</th>
				</xsl:if>
			</tr>
			<tr id="monitor-acpr-table-header-row" bgcolor="#00AEEF">
				<th align='left'>Target</th>
				<th align='left'>Source</th>
				<th align='left'>Control Knob</th>
				<th align='center' width='135px'>Trip Point Temperature</th>
				<th align='center' width='100px'>Control Point</th>
				<th align='center' width='100px'>Control Increment</th>
				<th align='center'>Sample Period (s)</th>
			</tr>
			<xsl:for-each select="acpr/acpr_entry">
				<tr>
					<td align='left'><xsl:value-of select="target_device_scope"/> (<xsl:value-of select="target_index"/>)</td>
					<td align='left'><xsl:value-of select="source_device_scope"/> (<xsl:value-of select="source_index"/>)</td>
					<td align='left'><xsl:value-of select="control_type"/></td>
					<td colspan="4">
						<table colspan="4" style="width:100%" id="monitor-acpr-table-entry">
							<xsl:for-each select="acpr_control_entry">
								<tr>
									<td style="border: thin solid" align='center' width='133px'><xsl:value-of select="trip_point"/></td>
									<td style="border: thin solid" align='center' width='100px'><xsl:value-of select="control_point"/></td>
									<td style="border: thin solid" align='center' width='100px'><xsl:value-of select="control_increment"/></td>
									<td style="border: thin solid" align='center'><xsl:value-of select="sampling_period"/></td>
							 </tr>
						 </xsl:for-each>
					 </table>
				 </td>
			 </tr>
		 </xsl:for-each>
	 </table>
	 </div>
	</div>

 </xsl:template>
</xsl:stylesheet>
<!-- end xsl -->

<!-- begin xsl -->
<?xml version="1.0" encoding="ISO-8859-1"?>
<!-- format_id=39-BC-1D-A0-5A-A1-15-49-A2-15-93-24-B4-C0-33-66 -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/power_share_policy_status">
		<div>
			<div>
				<table border="1" style="float: right;" id="monitor-power-share-participant-status-table">
					<tr id="monitor-power-share-participant-status-table-header-row" bgcolor="#00AEEF" colspan="2">
						<th colspan="2">Power Share Participant Status</th>
					</tr>
					<xsl:for-each select="power_share_participant_status/participantStatus">
						<tr>
							<th>
								<xsl:value-of select="name" />
							</th>
							<td align='right'>
								<xsl:value-of select="value" />
							</td>
						</tr>
					</xsl:for-each>
				</table>

				<table border="1" style="float: left;" id="monitor-power-share-variables-table">
					<tr id="monitor-power-share-variables-table-header-row" bgcolor="#00AEEF" colspan="2">
						<th colspan="2">Power Share Variables</th>
					</tr>
					<xsl:for-each select="power_share_variables/variable">
						<tr>
							<th>
								<xsl:value-of select="name" />
							</th>
							<td align='right'>
								<xsl:value-of select="value" />
							</td>
						</tr>
					</xsl:for-each>
				</table>
			</div>

			<div style="clear: both;"></div>
			<br></br>

			<div>
				<table id="monitor-psha-table" border="1">
					<tr bgcolor="#00AEEF" colspan="5">
						<th colspan="3">Power Share Algorithm Table (PSHA)</th>
					</tr>
					<tr id="monitor-psha-table-header-row" bgcolor="#00AEEF">
						<th align='left'>Participant</th>
						<th align='left'>Domain</th>
						<th align='right'>Default Bias</th>
					</tr>
					<xsl:for-each select="psha/psha_entry">
						<tr>
							<td align='left'>
								<xsl:value-of select="participant_scope"/> (<xsl:value-of select="participant_index"/>)
							</td>
							<td align='left'>
								<xsl:value-of select="domain"/> (<xsl:value-of select="domain_index"/>)
							</td>
							<td align='right'>
								<xsl:value-of select="default_bias"/>
							</td>
						</tr>
					</xsl:for-each>
				</table>
			</div>
		</div>
	</xsl:template>
</xsl:stylesheet>
<!-- end xsl -->

<!-- begin xsl -->
<?xml version="1.0" encoding="ISO-8859-1"?>
<!-- format_id=B4-38-5E-A7-AC-A7-7B-4A-8B-DC-1A-15-72-BE-31-8E -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="/power_share_policy2_status">
	<div>
    <div>
      <table border="1" style="float: left;" id="monitor-power-share-2-variables-table">
          <tr id="monitor-power-share-2-variables-table-header-row" bgcolor="#00AEEF" colspan="2">
            <th colspan="2">Power Share 2 Variables</th>
          </tr>
          <xsl:for-each select="power_share_2_variables/variable">
            <tr>
              <th>
                <xsl:value-of select="name" />
              </th>
              <td align='right'>
                <xsl:value-of select="value" />
              </td>
            </tr>
          </xsl:for-each>
        </table>
              
      <xsl:if test="power_share_rebalancer_status/power_control_type='PL1'">
        <div>
          <table border="1" style="float: right;" id="monitor-power-share-rebalancer-status-table">
            <tr id="monitor-power-share-rebalancer-status-table-header-row" bgcolor="#00AEEF" colspan="2">
              <th colspan="2">Power Share 2 PL1 Rebalancer Status</th>
            </tr>
            <xsl:for-each select="power_share_rebalancer_status/PL1">
              <tr>
                <th>
                  <xsl:value-of select="name" />
                </th>
                <td align='right'>
                  <xsl:value-of select="value" />
                </td>
              </tr>
            </xsl:for-each>
          </table>
        </div>
        </xsl:if>

      <div style="clear: both;"></div>
      <br></br>
      
        <xsl:if test="power_share_rebalancer_status/power_control_type='PL2'">
          <div>
          <table border="1" style="float: right;" id="monitor-power-share-rebalancer-status-table">
            <tr id="monitor-power-share-rebalancer-status-table-header-row" bgcolor="#00AEEF" colspan="2">
              <th colspan="2">Power Share 2 PL2 Rebalancer Status</th>
            </tr>
            <xsl:for-each select="power_share_rebalancer_status/PL2">
              <tr>
                <th>
                  <xsl:value-of select="name" />
                </th>
                <td align='right'>
                  <xsl:value-of select="value" />
                </td>
              </tr>
            </xsl:for-each>
          </table>
         </div>
        </xsl:if>

      <div style="clear: both;"></div>
      <br></br>
      
        <xsl:if test="power_share_rebalancer_status/power_control_type='PL4'">
          <div>
          <table border="1" style="float: right;" id="monitor-power-share-rebalancer-status-table">
            <tr id="monitor-power-share-rebalancer-status-table-header-row" bgcolor="#00AEEF" colspan="2">
              <th colspan="2">Power Share 2 PL4 Rebalancer Status</th>
            </tr>
            <xsl:for-each select="power_share_rebalancer_status/PL4">
              <tr>
                <th>
                  <xsl:value-of select="name" />
                </th>
                <td align='right'>
                  <xsl:value-of select="value" />
                </td>
              </tr>
            </xsl:for-each>
          </table>
          </div>
        </xsl:if>

      <div style="clear: both;"></div>
      <br></br>
      
      </div>
				
		<div style="clear: both;"></div>
		<br></br>


		<div>
			<table id="monitor-psh2-table" border="1" style="float: left;">
				<tr bgcolor="#00AEEF" colspan="5">
					<th colspan="3">Power Share Algorithm Table 2 (PSH2)</th>
				</tr>
				<tr id="monitor-psha-table-header-row" bgcolor="#00AEEF">
					<th align='left'>Participant</th>
					<th align='left'>Domain</th>
					<th align='right'>Default Bias</th>
				</tr>
				<xsl:for-each select="psh2/psh2_entry">
					<tr>
						<td align='left'>
							<xsl:value-of select="participant_scope"/> (<xsl:value-of select="participant_index"/>)
						</td>
						<td align='left'>
							<xsl:value-of select="domain"/> (<xsl:value-of select="domain_index"/>)
						</td>
						<td align='right'>
							<xsl:value-of select="default_bias"/>
						</td>
					</tr>
				</xsl:for-each>
			</table>
      <br/>
      <table border="1" style="float: right;" id="monitor-power-share-2-pl-sharing-table">
        <tr id="monitor-power-share-2-pl-sharing-table-header-row" bgcolor="#00AEEF" colspan="2">
          <th colspan="2">PL Sharing Feature State</th>
        </tr>
        <tr>
          <td align='left' >Turbo Power Sharing</td>
          <td align='left'>
            <xsl:value-of select="pl2_pl4_sharing_status/pl2_pl4_sharing"/>
          </td>
        </tr>
      </table>
		<br/>
			
		<table border="1" style="float: right;" id="monitor-power-share-2-slowpoll-events-info">
			<tr bgcolor="#00AEEF" colspan="2">
				<th colspan="3">Slowpoll-Exit Event Info</th>
			</tr>
			<tr id="monitor-power-share-2-slowpoll-events-info-table-header-row" bgcolor="#00AEEF">
				<th align='left' style='max-width:80px; min-width:80px;'>Event Type</th>
				<th align='left' style='max-width:80px; min-width:100px;'>Time (mS)</th>
			</tr>
			<xsl:for-each select="slowpoll_events_info/event_info">
				<tr>
					<td align='left'>
						<xsl:value-of select="event_name"/>
					</td>
					<td align='left'>
						<xsl:value-of select="time_since_last_trigger"/>
					</td>
				</tr>
			</xsl:for-each>
		</table>

	</div>


</div>
  </xsl:template>
</xsl:stylesheet>
<!-- end xsl -->

<!-- begin xsl -->
<?xml version="1.0" encoding="ISO-8859-1"?>
<!-- format_id=2D-0D-D4-6B-AA-98-4B-A4-1A-92-D2-2B-DE-31-17-F1 -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/itm_policy_status">
		<div style="float:left;">
			<xsl:if test="count(power_limit_calculator/failure_reason) &gt; 0">
				<div id="monitor-itm-policy-notifications" style="background-color:#FFB2B2; padding:5px">
					<xsl:value-of select="power_limit_calculator/failure_reason"/>
				</div>
				<br />
			</xsl:if>
			<table id="monitor-itmt-table" border="1">
				<tr bgcolor="#00AEEF">
					<th colspan="6">Intelligent Thermal Management Table (ITMT)</th>
				</tr>
				<tr id="monitor-itmt-table-header-row" bgcolor="#00AEEF">
					<th align='center'>Target</th>
					<th align='center' width='100px'>Trip Point Temperature</th>
					<th align='center' width='100px'>TCPU PL1 MIN</th>
					<th align='center' width='100px'>TCPU PL1 MAX</th>
					<th align='center' width='100px'>Sustained TCPU PL2 MAX</th>
					<th align='center' width='100px'>Sustained Time for PL2</th>
				</tr>
				<xsl:variable name="rowcount" select="itmt/count" />
				<xsl:for-each select="itmt/itmt_entry">
					<tr>
						<td align='center'>
							<xsl:value-of select="target_scope"/> (<xsl:value-of select="target_index"/>)
						</td>
						<td align='center'>
							<xsl:value-of select="trip_point_temperature"/>
						</td>
						<td align='center'>
							<xsl:value-of select="pl1_min"/>
						</td>
						<td align='center'>
							<xsl:value-of select="pl1_max"/>
						</td>
						<xsl:if test="position()=1">
							<td align='center' rowspan="{$rowcount}">
								<xsl:value-of select="sustained_pl2_max"/>
							</td>
						</xsl:if>
						<xsl:if test="position()=1">
							<td align='center' rowspan="{$rowcount}">
								<xsl:value-of select="sustained_time_pl2"/>
							</td>
						</xsl:if>
					</tr>
				</xsl:for-each>
			</table>
			<br />
			<table border="1" id="monitor-power-limit-calculator">
				<tr bgcolor="#00AEEF">
					<th colspan="5">Power Limit Calculator</th>
				</tr>
				<tr id="monitor-power-limit-calculator-header-row" bgcolor="#00AEEF">
					<th align='center'>Source</th>
					<th align='center'>Domain</th>
					<th align='center'>Control Type</th>
					<th align='center'>Requested Value</th>
					<th align='center'>Granted Value</th>
				</tr>
				<xsl:for-each select="power_limit_calculator/variable">
					<xsl:choose>
						<xsl:when test="is_equal='true'">
							<tr>
								<td align='center'><xsl:value-of select="source_name" /> (<xsl:value-of select="source_index"/>)</td>
								<td align='center'><xsl:value-of select="domain_name" /> (<xsl:value-of select="domain_index"/>)</td>
								<td align='center'><xsl:value-of select="control_type" /></td>
								<td align='center' bgcolor="#FFFF99"><xsl:value-of select="requested_value" /></td>
								<td align='center' bgcolor="#FFFF99"><xsl:value-of select="granted_value" /></td>
							</tr>
						</xsl:when>
						<xsl:otherwise>
							<tr>
								<td align='center'><xsl:value-of select="source_name" /> (<xsl:value-of select="source_index"/>)</td>
								<td align='center'><xsl:value-of select="domain_name" /> (<xsl:value-of select="domain_index"/>)</td>
								<td align='center'><xsl:value-of select="control_type" /></td>
								<td align='center'><xsl:value-of select="requested_value" /></td>
								<td align='center'><xsl:value-of select="granted_value" /></td>
							</tr>
						</xsl:otherwise>
					</xsl:choose>	
				</xsl:for-each>
			</table>
			<br />
			<table border="1" id="monitor-targets">
				<tr bgcolor="#00AEEF">
					<th colspan="7">Targets</th>
				</tr>
				<tr id="monitor-targets-header-row" bgcolor="#00AEEF">
					<th align='center'>Target</th>
					<th align='center' width='100px'>Current Temperature</th>
					<th align='center' width='100px'>Trip Point Temperature</th>
					<th align='center' width='100px'>TCPU PL1 MIN</th>
					<th align='center' width='100px'>TCPU PL1 MAX</th>
					<th align='center' width='100px'>Sustained TCPU PL2 MAX</th>
					<th align='center' width='100px'>Sustained Time for PL2</th>
				</tr>					
				<xsl:for-each select="targets/variable">
					<xsl:choose>
						<xsl:when test="is_tripped='true'">
							<tr>
								<td align='center' bgcolor="#FFFF99"><xsl:value-of select="name" /> (<xsl:value-of select="index"/>)</td>
								<td align='center' bgcolor="#FFFF99"><xsl:value-of select="current_temp"/></td>
								<td align='center' bgcolor="#FFFF99"><xsl:value-of select="trippoint"/></td>
								<td align='center' bgcolor="#FFFF99"><xsl:value-of select="pl1_min"/></td>
								<td align='center' bgcolor="#FFFF99"><xsl:value-of select="pl1_max"/></td>
								<td align='center' bgcolor="#FFFF99"><xsl:value-of select="sustained_pl2_max"/></td>
								<td align='center' bgcolor="#FFFF99"><xsl:value-of select="sustained_time_pl2"/></td>
							</tr>
						</xsl:when>
						<xsl:otherwise>
							<tr>
								<td align='center'><xsl:value-of select="name" /> (<xsl:value-of select="index"/>)</td>
								<td align='center'><xsl:value-of select="current_temp"/></td>
								<td align='center'><xsl:value-of select="trippoint"/></td>
								<td align='center'><xsl:value-of select="pl1_min"/></td>
								<td align='center'><xsl:value-of select="pl1_max"/></td>
								<td align='center'><xsl:value-of select="sustained_pl2_max"/></td>
								<td align='center'><xsl:value-of select="sustained_time_pl2"/></td>
							</tr>
						</xsl:otherwise>
					</xsl:choose>				
				</xsl:for-each>
			</table>
		</div>
		<div style="float:right;">
			<table border="1" id="monitor-soc-telemetry-table">
				<tr id="monitor-soc-telemetry-table-header-row" bgcolor="#00AEEF" colspan="2">
					<th colspan="2">Soc Telemetry</th>
				</tr>
				<xsl:for-each select="soc_telemetry/variable">
					<tr>
						<th>
							<xsl:value-of select="name" />
						</th>
						<td align='right'>
							<xsl:value-of select="value" />
						</td>
					</tr>
				</xsl:for-each>
			</table>
		</div>
	</xsl:template>
</xsl:stylesheet>
<!-- end xsl -->

<!-- begin xsl -->
<?xml version="1.0" encoding="ISO-8859-1"?>
<!-- format_id=A1-44-7A-ED-BD-3B-63-4B-97-3C-26-92-E8-6E-92-DF -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/adaptive_user_presence_policy_status">
		<div style="float:right;">
			<table id="monitor-aup-values" border ="1">
				<tr bgcolor="#00AEEF">
					<th colspan="2">User Attention Level</th>
				</tr>
				<tr>
					<td align='left' >Platform User Presence</td>
					<td align='left'>
						<xsl:value-of select="user_presence/user_presence"/>
					</td>
				</tr>
				<tr>
					<td align='left' >Correlation</td>
					<td align='left'>
						<xsl:value-of select="user_presence/correlation"/>
					</td>
				</tr>
				<tr>
					<td align='left' >Misprediction Count</td>
					<td align='left'>
						<xsl:value-of select="user_presence/misprediction_count"/>
					</td>
				</tr>			
			</table>
			<br />
			<table id="monitor-aup-timers" border ="1">
				<tr bgcolor="#00AEEF">
					<th colspan="2">Timers</th>
				</tr>
				<tr bgcolor="#00AEEF">
					<th align='center' >Timer Name</th>
					<th align='center' > Countdown (s)</th>
				</tr>
				<xsl:for-each select="timers/timer">
					<tr>
						<th>
							<xsl:value-of select="timer_name" />
						</th>
					<td align='right'>
						<xsl:value-of select="timer_status/time_until_expires" />
					</td>
					</tr>
				</xsl:for-each>
			</table>

			<br/>
			<table id="monitor-adaptive-user-presence-dimming-table" border="1">
				<tr  bgcolor="#00AEEF">
					<th colspan="2">AUPT Dimming Configurations</th>
				</tr>
				<xsl:for-each select="aupt/aupt_entry/dimming_configurations">
					<tr>
						<td align='left' >User Not Present</td>
						<td colspan ='2'>
							<table id="monitor-adaptive-user-presence-not-present-dimming-table" colspan="2" style="width:100%" cellpadding="5" cellspacing="2">
								<tr id="user-not-present-dimming-interval">
									<td>Dimming Interval</td>
									<td>
										<xsl:value-of select="user_not_present_dimming_interval"/>
									</td>
								</tr>
								<tr id="user-not-present-dim-target">
									<td>Dim Target</td>
									<td>
										<xsl:value-of select="user_not_present_dim_target"/>
									</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td >User Disengaged</td>
						<td colspan ='2'>
							<table id="monitor-adaptive-user-presence-disengaged-dimming-table" colspan="2" style="width:100%" cellpadding="5" cellspacing="2">
								<tr id="user-disengaged-dimming-interval">
									<td>Dimming Interval</td>
									<td>
										<xsl:value-of select="user_disengaged_dimming_interval"/>
									</td>
								</tr>
								<tr id="user-disengaged-dim-target">
									<td>Dim Target</td>
									<td>
										<xsl:value-of select="user_disengaged_dim_target"/>
									</td>
								</tr>
								<tr id="user-disengaged-dim-wait-time">
									<td>Dim Wait Time</td>
									<td>
										<xsl:value-of select="user_disengaged_dim_wait_time"/>
									</td>
								</tr>
							</table>
						</td>
					</tr>
					<!--<tr>
					<td>Dimming Interval</td>
					<td>
						<xsl:value-of select="presentation_mode_dimming_interval"/>
					</td>
				</tr>
				<tr>
					<td>Dim Target</td>
					<td>
						<xsl:value-of select="presentation_mode_dim_target"/>
					</td>
				</tr>
				<tr>
					<td>Dim Wait Time</td>
					<td>
						<xsl:value-of select="presentation_mode_dim_wait_time"/>
					</td>
				</tr>-->
				</xsl:for-each>
			</table>
		</div>
		
	<div style="float:left;">
		<table id="monitor-adaptive-user-presence-table" border="1">
			<tr bgcolor="#00AEEF">
				<th colspan="2">Adaptive User Presence Table (AUPT)</th>
			</tr>
			<xsl:for-each select="aupt/aupt_entry">
				<xsl:for-each select="wake_on_approach">
					<tr>
						<td align='center'>Wake On Approach</td>
						<td colspan ='2'>
							<table id="monitor-adaptive-user-presence-wake-on-approach-table" colspan="2" style="width:100%" cellpadding="5" cellspacing="2">
								<tr id="wake-on-approach-feature-state">
									<td>Wake On Approach Feature</td>
									<td>
										<xsl:value-of select="wake_on_approach"/>
									</td>
								</tr>
								<tr id="wake-on-approach-external-monitor-feature-state">
									<td>Wake On Approach With External Monitor</td>
									<td>
										<xsl:value-of select="wake_on_approach_with_external_monitor"/>
									</td>
								</tr>
								<tr id="wake-on-approach-low-battery-feature-state">
									<td>Wake On Approach On Low Battery</td>
									<td>
										<xsl:value-of select="wake_on_approach_when_low_battery"/>
									</td>
								</tr>
								<tr id="wake-on-approach-low-battery-limit">
									<td>Low Battery Limit (%)</td>
									<td><xsl:value-of select="wake_on_approach_battery_remaining_percentage_limit"/></td>
								</tr>
							</table>
						</td>
					</tr>
				</xsl:for-each>
				<xsl:for-each select="walk_away_lock">
					<tr>
						<td align='center' >Walk Away Lock</td>
						<td colspan ='2'>
							<table id="monitor-adaptive-user-presence-walk-away-lock-table" colspan="2" style="width:100%" cellpadding="5" cellspacing="2">
								<tr id="walk-away-lock-feature-state">
									<td>Walk Away Lock Feature</td>
									<td>
										<xsl:value-of select="walk_away_lock"/>
									</td>
								</tr>
								<tr id="walk-away-lock-external-monitor-feature-state">
									<td>Walk Away Lock With External Monitor</td>
									<td>
										<xsl:value-of select="walk_away_lock_with_external_monitor"/>
									</td>
								</tr>
								<tr id="walk-away-lock-pre-dim-wait-time">
									<td>Walk Away Lock Pre Dim Wait Time</td>
									<td>
										<xsl:value-of select="walk_away_lock_pre_dim_wait_time"/>
									</td>
								</tr>
								<tr id="user-present-wait-time">
									<td>User Present Wait Time</td>
									<td>
										<xsl:value-of select="user_present_wait_time"/>
									</td>
								</tr>
								<tr id="dim-screen-before-lock-feature-state">
									<td>Dim Screen Before Lock</td>
									<td>
										<xsl:value-of select="dim_screen"/>
									</td>
								</tr>
								<tr id="display_required_feature_state">
									<td>Honor Power Requests For Display</td>
									<td>
										<xsl:value-of select="honor_power_requests_for_display"/>
									</td>
								</tr>
								<tr id="user-in-call-feature-state">
									<td>Honor User in Call</td>
									<td>
										<xsl:value-of select="honor_user_in_call"/>
									</td>
								</tr>
								<tr id="screen-lock-wait-time">
									<td>Screen Lock Wait Time</td>
									<td>
										<xsl:value-of select="user_not_present_lock_wait_time"/>
									</td>
								</tr>
								<tr id="display-off-after-lock-feature-state">
									<td>Display Off After Lock</td>
									<td>
										<xsl:value-of select="display_off_after_lock"/>
									</td>
								</tr>
							</table>
						</td>
					</tr>
				</xsl:for-each>
				<xsl:for-each select="no_lock_on_presence">
					<tr>
						<td align='center' >No Lock On Presence</td>
						<td colspan ='2'>
							<table id="monitor-adaptive-user-presence-no-lock-on-presence-table" colspan="2" style="width:100%" cellpadding="5" cellspacing="2">
								<tr id="no-lock-on-presence-feature-state">
									<td>No Lock On Presence Feature</td>
									<td>
										<xsl:value-of select="no_lock_on_presence"/>
									</td>
								</tr>
								<tr>
									<td align='left'>No Lock On Presence With External Monitor</td>
									<td align='left'>
										<xsl:value-of select="no_lock_on_presence_with_external_monitor"/>
									</td>
								</tr>
								<tr id="no-lock-on-presence-when-on-battery-feature-state">
									<td>No Lock On Presence On Battery</td>
									<td>
										<xsl:value-of select="no_lock_on_presence_when_on_battery"/>
									</td>
								</tr>
								<tr id="no-lock-on-presence-low-battery-limit">
									<td>Low Battery Limit (%)</td>
									<td>
										<xsl:value-of select="no_lock_on_presence_battery_remaining_percentage_limit"/>
									</td>
								</tr>
								<tr id="no-lock-on-presence-reset-wait-time">
									<td>No Lock On Presence Reset Wait Time</td>
									<td>
										<xsl:value-of select="no_lock_on_presence_reset_wait_time"/>
									</td>
								</tr>
								<tr id="fail-safe-timeout">
									<td>Fail Safe Timeout</td>
									<td>
										<xsl:value-of select="fail_safe_timeout"/>
									</td>
								</tr>
							</table>
						</td>
					</tr>
				</xsl:for-each>
				<xsl:for-each select="adaptive_dimming">
					<tr>
						<td align='center' >Adaptive Dimming</td>
						<td colspan ='2'>
							<table id="monitor-adaptive-user-presence-adaptive-dimming-table" colspan="2" style="width:100%" cellpadding="5" cellspacing="2">
								<tr id="adaptive-dimming-feature-state">
									<td>Adaptive Dimming Feature</td>
									<td>
										<xsl:value-of select="adaptive_dimming"/>
									</td>
								</tr>
								<tr id="adaptive-dimming-external-monitor-feature-state">
									<td>Adaptive Dimming With External Monitor</td>
									<td>
										<xsl:value-of select="adaptive_dimming_with_external_monitor"/>
									</td>
								</tr>
								<!--<tr id="adaptive-dimming-presentation-mode-feature-state">
										<td>Enable Adaptive Dimming (Presentation Mode)</td>
										<td>
											<xsl:value-of select="enable_adaptive_dimming_in_presentation_mode"/>
										</td>
									</tr>-->
								<tr id="adaptive-dimming-pre-dim-wait-time">
										<td>Adaptive Dimming Pre Dim Wait Time</td>
										<td>
											<xsl:value-of select="adaptive_dimming_pre_dim_wait_time"/>
										</td>
								</tr>
								<tr id="misprediction-with-face-detection-user-not-present">
									<td>Misprediction with Face Detection When User Not Present</td>
									<td>
										<xsl:value-of select="user_not_present_misprediction_with_face_detection"/>
									</td>
								</tr>
								<tr id="misprediction-time-window">
									<td>Misprediction Time Window</td>
									<td>
										<xsl:value-of select="user_not_present_misprediction_time_window"/>
									</td>
								</tr>
								<tr id="dim-wait-time-misprediction-1">
									<td>Dim Wait Time (Misprediction == 1)</td>
									<td>
										<xsl:value-of select="user_not_present_dim_wait_time_misprediction_1"/>
									</td>
								</tr>
								<tr id="dim-wait-time-misprediction-2">
									<td>Dim Wait Time (Misprediction == 2)</td>
									<td>
										<xsl:value-of select="user_not_present_dim_wait_time_misprediction_2"/>
									</td>
								</tr>
								<tr id="dim-wait-time-misprediction-3">
									<td>Dim Wait Time (Misprediction == 3)</td>
									<td>
										<xsl:value-of select="user_not_present_dim_wait_time_misprediction_3"/>
									</td>
								</tr>
								<tr id="dim-wait-time-misprediction-4">
									<td> Dim Wait Time (Misprediction == 4)</td>
									<td>
										<xsl:value-of select="user_not_present_dim_wait_time_misprediction_4"/>
									</td>
								</tr>
							</table>
						</td>
					</tr>
				</xsl:for-each>
			</xsl:for-each>
		</table>
		</div>
	</xsl:template>
</xsl:stylesheet>

<!-- begin xsl -->
<?xml version="1.0" encoding="ISO-8859-1"?>
<!-- format_id=65-10-95-92-27-64-30-4B-97-37-13-CC-70-EF-A2-1A -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/system_configuration">
		<div style="float:left;">
			
			<tr>
				<table id="hwpf-status-table" border="1">
					<tr bgcolor="#00AEEF" colspan="2">
						<th colspan="2">Hardware Prefetcher</th>
					</tr>
					<tr>
						<th>Feature</th>
						<td>
							<xsl:value-of select="hwpf/hwpf_entry/feature_status"/>
						</td>
					</tr>
				</table>
			</tr>
		</div>
	</xsl:template>
</xsl:stylesheet>
<!-- end xsl -->

<!-- begin xsl -->
<?xml version="1.0" encoding="ISO-8859-1"?>
<!-- format_id=64-BA-26-4E-AE-DE-E2-44-87-96-95-E7-D0-58-48-90 -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="/energy_performance_optimizer_policy_status">
    <div style="float:left;">
      <table border="1" id ="energy-performance-optimizer-table">
        <tr bgcolor="#00AEEF">
          <th colspan="6">Energy Performance Optimizer Table (EPOT)</th>
        </tr>
        <tr id="monitor-epot-table-header-row" bgcolor="#00AEEF">
          <th align='center' width='100px'>Power Source</th>
          <th align='center' width='150px'>Mode</th>
          <th align='center' width='100px'>Status</th>
          <th align='center' width='100px'>Aggressiveness Level</th>
        </tr>
        <xsl:for-each select="epot/epot_entry">
          <tr>
            <td align='center'>
              <xsl:value-of select="power_source"/>
            </td>
            <td align='center'>
              <xsl:value-of select="mode"/>
            </td>
            <td align='center'>
              <xsl:value-of select="status"/>
            </td>
            <td align='center'>
              <xsl:value-of select="aggressiveness_level"/>
            </td>
          </tr>
        </xsl:for-each>
      </table>
		
		<br></br>

		<table id="monitor-epo-values" border ="2">
			<tr bgcolor="#00AEEF">
			  <th colspan="2">Energy Performance Optimizer Status Table</th>
			</tr>
			<tr>
			  <td align='left' >Soc Workload Classification</td>
			  <td align='left'>
				<xsl:value-of select="energy_performance_optimizer_status/mbt_hint"/>
			  </td>
			</tr>
			<!--<tr>
			  <td align='left' >Battery Drain Rate</td>
			  <td align='left'>
				<xsl:value-of select="energy_performance_optimizer_status/battery_drain_rate"/>
			  </td>
			</tr>-->
			<tr>
			  <td align='left' >Performance Preference</td>
			  <td align='left'>
				<xsl:value-of select="energy_performance_optimizer_status/ppm_package_type"/>
			  </td>
			</tr>
			<tr>
				<td align='left'>System Mode</td>
				<td align='left'>
					<xsl:value-of select="energy_performance_optimizer_status/system_mode"/>
				</td>
			</tr>
			<tr>
				<td align='left'>Power Source</td>
				<td align='left'>
					<xsl:value-of select="energy_performance_optimizer_status/power_source"/>
				</td>
			</tr>
		</table>
	</div>
  </xsl:template>
</xsl:stylesheet>
<!-- end xsl -->
