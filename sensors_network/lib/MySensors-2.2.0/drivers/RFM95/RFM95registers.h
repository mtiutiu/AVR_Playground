/*
* The MySensors Arduino library handles the wireless radio link and protocol
* between your home built sensors/actuators and HA controller of choice.
* The sensors forms a self healing radio network with optional repeaters. Each
* repeater and gateway builds a routing tables in EEPROM which keeps track of the
* network topology allowing messages to be routed to nodes.
*
* Created by Henrik Ekblad <henrik.ekblad@mysensors.org>
* Copyright (C) 2013-2016 Sensnology AB
* Full contributor list: https://github.com/mysensors/Arduino/graphs/contributors
*
* Documentation: http://www.mysensors.org
* Support Forum: http://forum.mysensors.org
*
* This program is free software; you can redistribute it and/or
* modify it under the terms of the GNU General Public License
* version 2 as published by the Free Software Foundation.
*
* Based on Mike McCauley's RFM95 library, Copyright (C) 2014 Mike McCauley <mikem@airspayce.com>
* Radiohead http://www.airspayce.com/mikem/arduino/RadioHead/index.html
* RFM95 driver refactored and optimized for MySensors, Copyright (C) 2016 Olivier Mauti <olivier@mysensors.org>
*
* Changelog:
* - ACK with sequenceNumber
* - ATC control
*
* Definitions for HopeRF LoRa radios:
* http://www.hoperf.com/upload/rf/RFM95_96_97_98W.pdf
* http://www.hoperf.cn/upload/rfchip/RF96_97_98.pdf
*
*/

// Register access
#define RFM95_READ_REGISTER						(0x7Fu)	//!< reading register
#define RFM95_WRITE_REGISTER					(0x80u)	//!< writing register
#define RFM95_NOP								(0x00u)	//!< NOP

// Registers, available in LoRa mode
#define RFM95_REG_00_FIFO						0x00 //!< REG_00_FIFO
#define RFM95_REG_01_OP_MODE					0x01 //!< REG_01_OP_MODE
#define RFM95_REG_02_RESERVED					0x02 //!< REG_02_RESERVED
#define RFM95_REG_03_RESERVED					0x03 //!< REG_03_RESERVED
#define RFM95_REG_04_RESERVED					0x04 //!< REG_04_RESERVED
#define RFM95_REG_05_RESERVED					0x05 //!< REG_05_RESERVED
#define RFM95_REG_06_FRF_MSB					0x06 //!< REG_06_FRF_MSB
#define RFM95_REG_07_FRF_MID					0x07 //!< REG_07_FRF_MID
#define RFM95_REG_08_FRF_LSB					0x08 //!< REG_08_FRF_LSB
#define RFM95_REG_09_PA_CONFIG					0x09 //!< REG_09_PA_CONFIG
#define RFM95_REG_0A_PA_RAMP					0x0a //!< REG_0A_PA_RAMP
#define RFM95_REG_0B_OCP						0x0b //!< REG_0B_OCP
#define RFM95_REG_0C_LNA						0x0c //!< REG_0C_LNA
#define RFM95_REG_0D_FIFO_ADDR_PTR				0x0d //!< REG_0D_FIFO_ADDR_PTR
#define RFM95_REG_0E_FIFO_TX_BASE_ADDR			0x0e //!< REG_0E_FIFO_TX_BASE_ADDR
#define RFM95_REG_0F_FIFO_RX_BASE_ADDR			0x0f //!< REG_0F_FIFO_RX_BASE_ADDR
#define RFM95_REG_10_FIFO_RX_CURRENT_ADDR		0x10 //!< REG_10_FIFO_RX_CURRENT_ADDR
#define RFM95_REG_11_IRQ_FLAGS_MASK				0x11 //!< REG_11_IRQ_FLAGS_MASK
#define RFM95_REG_12_IRQ_FLAGS					0x12 //!< REG_12_IRQ_FLAGS
#define RFM95_REG_13_RX_NB_BYTES				0x13 //!< REG_13_RX_NB_BYTES
#define RFM95_REG_14_RX_HEADER_CNT_VALUE_MSB	0x14 //!< REG_14_RX_HEADER_CNT_VALUE_MSB
#define RFM95_REG_15_RX_HEADER_CNT_VALUE_LSB	0x15 //!< REG_15_RX_HEADER_CNT_VALUE_LSB
#define RFM95_REG_16_RX_PACKET_CNT_VALUE_MSB	0x16 //!< REG_16_RX_PACKET_CNT_VALUE_MSB
#define RFM95_REG_17_RX_PACKET_CNT_VALUE_LSB	0x17 //!< REG_17_RX_PACKET_CNT_VALUE_LSB
#define RFM95_REG_18_MODEM_STAT					0x18 //!< REG_18_MODEM_STAT
#define RFM95_REG_19_PKT_SNR_VALUE				0x19 //!< REG_19_PKT_SNR_VALUE
#define RFM95_REG_1A_PKT_RSSI_VALUE				0x1a //!< REG_1A_PKT_RSSI_VALUE
#define RFM95_REG_1B_RSSI_VALUE					0x1b //!< REG_1B_RSSI_VALUE
#define RFM95_REG_1C_HOP_CHANNEL				0x1c //!< REG_1C_HOP_CHANNEL
#define RFM95_REG_1D_MODEM_CONFIG1				0x1d //!< REG_1D_MODEM_CONFIG1
#define RFM95_REG_1E_MODEM_CONFIG2				0x1e //!< REG_1E_MODEM_CONFIG2
#define RFM95_REG_1F_SYMB_TIMEOUT_LSB			0x1f //!< REG_1F_SYMB_TIMEOUT_LSB
#define RFM95_REG_20_PREAMBLE_MSB				0x20 //!< REG_20_PREAMBLE_MSB
#define RFM95_REG_21_PREAMBLE_LSB				0x21 //!< REG_21_PREAMBLE_LSB
#define RFM95_REG_22_PAYLOAD_LENGTH				0x22 //!< REG_22_PAYLOAD_LENGTH
#define RFM95_REG_23_MAX_PAYLOAD_LENGTH			0x23 //!< REG_23_MAX_PAYLOAD_LENGTH
#define RFM95_REG_24_HOP_PERIOD					0x24 //!< REG_24_HOP_PERIOD
#define RFM95_REG_25_FIFO_RX_BYTE_ADDR			0x25 //!< REG_25_FIFO_RX_BYTE_ADDR
#define RFM95_REG_26_MODEM_CONFIG3				0x26 //!< REG_26_MODEM_CONFIG3

// Reserved when in LoRa mode
#define RFM95_REG_40_DIO_MAPPING1				0x40 //!< REG_40_DIO_MAPPING1
#define RFM95_REG_41_DIO_MAPPING2				0x41 //!< REG_41_DIO_MAPPING2
#define RFM95_REG_42_VERSION					0x42 //!< REG_42_VERSION
#define RFM95_REG_4B_TCXO						0x4b //!< REG_4B_TCXO
#define RFM95_REG_4D_PA_DAC						0x4d //!< REG_4D_PA_DAC
#define RFM95_REG_5B_FORMER_TEMP				0x5b //!< REG_5B_FORMER_TEMP
#define RFM95_REG_61_AGC_REF					0x61 //!< REG_61_AGC_REF
#define RFM95_REG_62_AGC_THRESH1				0x62 //!< REG_62_AGC_THRESH1
#define RFM95_REG_63_AGC_THRESH2				0x63 //!< REG_63_AGC_THRESH2
#define RFM95_REG_64_AGC_THRESH3				0x64 //!< REG_64_AGC_THRESH3

// RFM95_REG_01_OP_MODE 0x01
#define RFM95_LONG_RANGE_MODE					0x80 //!< LONG_RANGE_MODE
#define RFM95_ACCESS_SHARED_REG					0x40 //!< ACCESS_SHARED_REG

#define RFM95_MODE_SLEEP						0x00 //!< MODE_SLEEP
#define RFM95_MODE_STDBY						0x01 //!< MODE_STDBY
#define RFM95_MODE_FSTX							0x02 //!< MODE_FSTX
#define RFM95_MODE_TX							0x03 //!< MODE_TX
#define RFM95_MODE_FSRX							0x04 //!< MODE_FSRX
#define RFM95_MODE_RXCONTINUOUS					0x05 //!< MODE_RXCONTINUOUS
#define RFM95_MODE_RXSINGLE						0x06 //!< MODE_RXSINGLE
#define RFM95_MODE_CAD							0x07 //!< MODE_CAD

// RFM95_REG_09_PA_CONFIG 0x09
#define RFM95_OUTPUT_POWER						0x0F //!< OUTPUT_POWER
#define RFM95_MAX_POWER							0x70 //!< MAX_POWER
#define RFM95_PA_SELECT							0x80 //!< PA_SELECT

// RFM95_REG_0A_PA_RAMP 0x0a
#define RFM95_PA_RAMP_3_4MS						0x00 //!< PA_RAMP_3_4MS
#define RFM95_PA_RAMP_2MS						0x01 //!< PA_RAMP_2MS
#define RFM95_PA_RAMP_1MS						0x02 //!< PA_RAMP_1MS
#define RFM95_PA_RAMP_500US						0x03 //!< PA_RAMP_500US
#define RFM95_PA_RAMP_250US						0x04 //!< PA_RAMP_250US
#define RFM95_PA_RAMP_125US						0x05 //!< PA_RAMP_125US
#define RFM95_PA_RAMP_100US						0x06 //!< PA_RAMP_100US
#define RFM95_PA_RAMP_62US						0x07 //!< PA_RAMP_62US
#define RFM95_PA_RAMP_50US						0x08 //!< PA_RAMP_50US
#define RFM95_PA_RAMP_40US						0x09 //!< PA_RAMP_40US
#define RFM95_PA_RAMP_31US						0x0A //!< PA_RAMP_31US
#define RFM95_PA_RAMP_25US						0x0B //!< PA_RAMP_25US
#define RFM95_PA_RAMP_20US						0x0C //!< PA_RAMP_20US
#define RFM95_PA_RAMP_15US						0x0D //!< PA_RAMP_15US
#define RFM95_PA_RAMP_12US						0x0E //!< PA_RAMP_12US
#define RFM95_PA_RAMP_10US						0x0F //!< PA_RAMP_10US
#define RFM95_LOW_PN_TX_PLL_OFF					0x10 //!< LOW_PN_TX_PLL_OFF

// RFM95_REG_0B_OCP 0x0b
#define RFM95_OCP_TRIM							0x1f //!< OCP_TRIM
#define RFM95_OCP_ON							0x20 //!< OCP_ON

// RFM95_REG_0C_LNA 0x0c
#define RFM95_LNA_BOOST_DEFAULT					0x20 //!< LNA_BOOST_DEFAULT
#define RFM95_LNA_BOOST							0x03 //!< LNA_BOOST

// RFM95_REG_11_IRQ_FLAGS_MASK 0x11
#define RFM95_CAD_DETECTED_MASK					0x01 //!< CAD_DETECTED_MASK
#define RFM95_FHSS_CHANGE_CHANNEL_MASK			0x02 //!< FHSS_CHANGE_CHANNEL_MASK
#define RFM95_CAD_DONE_MASK						0x04 //!< CAD_DONE_MASK
#define RFM95_TX_DONE_MASK						0x08 //!< TX_DONE_MASK
#define RFM95_VALID_HEADER_MASK					0x10 //!< VALID_HEADER_MASK
#define RFM95_PAYLOAD_CRC_ERROR_MASK			0x20 //!< PAYLOAD_CRC_ERROR_MASK
#define RFM95_RX_DONE_MASK						0x40 //!< RX_DONE_MASK
#define RFM95_RX_TIMEOUT_MASK					0x80 //!< RX_TIMEOUT_MASK

// RFM95_REG_12_IRQ_FLAGS 0x12
#define RFM95_CAD_DETECTED						0x01 //!< CAD_DETECTED
#define RFM95_FHSS_CHANGE_CHANNEL				0x02 //!< FHSS_CHANGE_CHANNEL
#define RFM95_CAD_DONE							0x04 //!< CAD_DONE
#define RFM95_TX_DONE							0x08 //!< TX_DONE
#define RFM95_VALID_HEADER						0x10 //!< VALID_HEADER
#define RFM95_PAYLOAD_CRC_ERROR					0x20 //!< PAYLOAD_CRC_ERROR
#define RFM95_RX_DONE							0x40 //!< RX_DONE
#define RFM95_RX_TIMEOUT						0x80 //!< RX_TIMEOUT

// RFM95_REG_18_MODEM_STAT 0x18
#define RFM95_MODEM_STATUS_SIGNAL_DETECTED		0x01 //!< MODEM_STATUS_SIGNAL_DETECTED
#define RFM95_MODEM_STATUS_SIGNAL_SYNCHRONIZED	0x02 //!< MODEM_STATUS_SIGNAL_SYNCHRONIZED
#define RFM95_MODEM_STATUS_RX_ONGOING			0x04 //!< MODEM_STATUS_RX_ONGOING
#define RFM95_MODEM_STATUS_HEADER_INFO_VALID	0x08 //!< MODEM_STATUS_HEADER_INFO_VALID
#define RFM95_MODEM_STATUS_CLEAR				0x10 //!< MODEM_STATUS_CLEAR

// RFM95_REG_1C_HOP_CHANNEL 0x1c
#define RFM95_RX_PAYLOAD_CRC_IS_ON				0x40 //!< RX_PAYLOAD_CRC_IS_ON
#define RFM95_PLL_TIMEOUT						0x80 //!< PLL_TIMEOUT

// RFM95_REG_1D_MODEM_CONFIG1 0x1d

#define RFM95_BW_7_8KHZ							0x00 //!< BW_7_8KHZ	
#define RFM95_BW_10_4KHZ						0x10 //!< BW_10_4KHZ
#define RFM95_BW_15_6KHZ						0x20 //!< BW_15_6KHZ
#define RFM95_BW_20_8KHZ						0x30 //!< BW_20_8KHZ
#define RFM95_BW_31_25KHZ						0x40 //!< BW_31_25KHZ
#define RFM95_BW_41_7KHZ						0x50 //!< BW_41_7KHZ
#define RFM95_BW_62_5KHZ						0x60 //!< BW_62_5KHZ
#define RFM95_BW_125KHZ							0x70 //!< BW_125KHZ
#define RFM95_BW_250KHZ							0x80 //!< BW_250KHZ
#define RFM95_BW_500KHZ							0x90 //!< BW_500KHZ

#define RFM95_IMPLICIT_HEADER_MODE_ON			0x01 //!< IMPLICIT_HEADER_MODE_ON
#define RFM95_CODING_RATE_4_5					0x02 //!< CODING_RATE_4_5
#define RFM95_CODING_RATE_4_6					0x04 //!< CODING_RATE_4_6
#define RFM95_CODING_RATE_4_7					0x06 //!< CODING_RATE_4_7
#define RFM95_CODING_RATE_4_8					0x08 //!< CODING_RATE_4_8

// RFM95_REG_1E_MODEM_CONFIG2 0x1e
#define RFM95_SPREADING_FACTOR_64CPS			0x60 //!< SPREADING_FACTOR_64CPS, SF6
#define RFM95_SPREADING_FACTOR_128CPS			0x70 //!< SPREADING_FACTOR_128CPS, SF7
#define RFM95_SPREADING_FACTOR_256CPS			0x80 //!< SPREADING_FACTOR_256CPS, SF8
#define RFM95_SPREADING_FACTOR_512CPS			0x90 //!< SPREADING_FACTOR_512CPS, SF9
#define RFM95_SPREADING_FACTOR_1024CPS			0xA0 //!< SPREADING_FACTOR_1024CPS, SF10
#define RFM95_SPREADING_FACTOR_2048CPS			0xB0 //!< SPREADING_FACTOR_2048CPS, SF11
#define RFM95_SPREADING_FACTOR_4096CPS			0xC0 //!< SPREADING_FACTOR_4096CPS, SF12

#define RFM95_SYM_TIMEOUT_MSB					0x03 //!< SYM_TIMEOUT_MSB
#define RFM95_RX_PAYLOAD_CRC_ON					0x04 //!< RX_PAYLOAD_CRC_ON
#define RFM95_TX_CONTINUOUS_MOdE				0x08 //!< TX_CONTINUOUS_MODE

// RFM95_REG_26_MODEM_CONFIG3 0x26
#define RFM95_LOW_DATA_RATE_OPTIMIZE			0x08 //!< LOW_DATA_RATE_OPTIMIZE
#define RFM95_AGC_AUTO_ON						0x04 //!< AGC_AUTO_ON

// RFM95_REG_4B_TCXO 0x4b
#define RFM95_TCXO_TCXO_INPUT_ON				0x10 //!< TCXO_TCXO_INPUT_ON

// RFM95_REG_4D_PA_DAC 0x4d
#define RFM95_PA_DAC_DISABLE					0x04 //!< PA_DAC_DISABLE
#define RFM95_PA_DAC_ENABLE						0x07 //!< PA_DAC_ENABLE