import mathfrom bisect import bisect_leftclass Delay:    """    :scs: 用子载波间隔"30"or"60"    :model:            1:FR1 FDD or TDD band with neither E-UTRA–NR nor NB-IoT–NR coexistence case (25600)            2:FR1 FDD band with E-UTRA–NR and/or NB-IoT–NR coexistence case (0)            3:FR1 TDD band with E-UTRA–NR and/or NB-IoT–NR coexistence case (39936)            4:FR2 (13792)    :    """    def __init__(self, scs, Ta, model):        self.Tc = 1 / (480 * pow(10, 3) * 4096)        self.scs = scs        self.Ta = Ta        self.model = model    def get_Nta(self):        Nta = self.Ta * 16 * 64 / (pow(2, (1000 * self.scs)))        return Nta    def get_Nta_offset(self):        """        :model1:FR1 FDD or TDD band with neither E-UTRA–NR nor NB-IoT–NR coexistence case (25600)        :model2:FR1 FDD band with E-UTRA–NR and/or NB-IoT–NR coexistence case (0)        :model3:FR1 TDD band with E-UTRA–NR and/or NB-IoT–NR coexistence case (39936)        :model4:FR2 (13792)        """        if self.model == 1:            Nta_offset = 25600        elif self.model == 2:            Nta_offset = 0        elif self.model == 3:            Nta_offset = 39936        elif self.model == 4:            Nta_offset = 13792        return Nta_offset    def get_T_Ta(self):        T_Ta = (self.get_Nta() + self.get_Nta_offset()) * self.Tc        return T_Ta    def get_distance(self):        distance = (3 * pow(10, 8)) * self.get_T_Ta() / 2        return distanceclass RSRP:    """    :此类用于RSRP    :first: 上行or下行,输入字符"U"or"D"    :scs: 用子载波间隔"30"or"60"    :scs_num: 子载波数量    :time_slot_number: 时隙数    :symbol: 上下行符号占比"4:1"\"7:3"\"8:2"    :antenna_num： 天线数    :peakrate: 峰值速率（Mbps）    :re: RE    :rank: RANK    :plan: 用户面占比    :transmission_power: 设备发射功率（基站或者UE）    :antenna_gain: 天线增益(包含基站和UE的天线增益）    :fc: 频段 "2.6G"/"3.5G"    :d: 距离    :material: 穿透的材料"glass"/"IIR"/"wood"/"concrete"    :OFDM: 符号    """    def __init__(self, first, scs, symbol, antenna_num=None, transmission_power=None, peakrate=None, fc=None, \                 d=None, material=None):        self.symbol = symbol        self.mcs = 8.0        self.plan = 0.8        self.transmission_power = transmission_power        self.antenna_gain = 0.0        self.fc = fc        self.first = first        self.d = d        self.material = material        self.scs = scs        self.antenna_num = 64        self.efficiency_down = [0.2344, 0.3066, 0.3770, 0.4902, 0.6016, 0.7402, 0.8770, 1.0273, 1.1758, 1.3262, 1.3281, \                                1.4766, 1.6953, 1.9141, 2.1602, 2.4063, 2.5703, 2.7305, 3.0293, 3.3223, 3.6094, 3.9023, \                                4.2129, 4.5234, 4.8164, 5.1152, 5.3320, 5.5547]        self.efficiency_up = [0.0586, 0.0781, 0.0977, 0.1250, 0.1523, 0.1934, 0.2344, 0.3066, 0.3770, 0.4902, 0.6016, \                              0.7402, 0.8770, 1.0273, 1.1758, 1.3262, 1.4766, 1.6953, 1.9141, 2.1602, 2.4063, 2.5703, \                              2.7305, 3.0156, 3.3223, 3.6094, 3.9023, 4.5234]        if antenna_num != None:            self.antenna_num = antenna_num        if peakrate != None:            self.peakrate = peakrate * pow(10, 6)        if scs == "30":            self.time_slot_number = 100 * 10 * (30 / 15.0)            self.re = 273 * 12 * 14.0            self.scs_num = 3276            self.OFDM = 273 * 12 * 100 * 10 * 2 * 14        elif scs == "60":            self.time_slot_number = 100 * 10 * (60 / 15.0)            self.re = 135 * 12 * 14.0            self.scs_num = 1620            self.OFDM = 135 * 12 * 100 * 10 * 4 * 14        else:            print("subcarrier interval error")        if first == "DL":            self.rank = 4.0            if symbol == "4:1":                self.symbol = (3 * 14.0 + 10) / (14.0 * 5)            elif symbol == "7:3":                self.symbol = (5 * 14.0 + 20) / 140.0            elif symbol == "8:2":                self.symbol = (7 * 14.0 + 6) / 140.0            else:                print("symbol error")            if self.fc == '2.6':                self.antenna_gain = 22.5 + 10            elif self.fc == '3.5':                self.antenna_gain = 28 + 10            elif self.fc == '28':                self.antenna_gain = 30 + 10        elif first == "UL":            self.rank = 2.0            if symbol == "4:1":                self.symbol = (1 * 14.0 + 2) / (14.0 * 5)            elif symbol == "7:3":                self.symbol = (3 * 14.0 + 4) / 140.0            elif symbol == "8:2":                self.symbol = (2 * 14.0 + 4) / 140.0            else:                print("symbol error")            if self.fc == '2.6':                self.antenna_gain = 16 + 10            elif self.fc == '3.5':                self.antenna_gain = 16.5 + 10            elif self.fc == '28':                self.antenna_gain = 20 + 10        else:            print("first error")    # def get_peakrate(self):    #     """    #     计算峰值速率    #     :return: 返回峰值速率    #     """    #     return self.time_slot_number * self.symbol * self.re * self.mcs * self.rank * self.plan    def get_path_loss(self):        """        :return: 路径损耗        """        if self.fc == '2.6':            path_loss = 28.0 + 22.0 * math.log(self.d, 10) + 20.0 * math.log(2413, 10)        elif self.fc == '3.5':            path_loss = 28.0 + 22.0 * math.log(self.d, 10) + 20.0 * math.log(3450, 10)        elif self.fc == '28':            path_loss = 28.0 + 22.0 * math.log(self.d, 10) + 20.0 * math.log(28000, 10)        return path_loss    def get_penetrate_loss(self):        """        :return: 穿透损耗        """        if self.material == 'glass':            if self.fc == '700':                return 2.10            if self.fc == '2.6':                return 2.50            if self.fc == '3.5':                return 2.70            if self.fc == '28':                return 7.60        elif self.material == 'IIR':            if self.fc == '700':                return 23.20            if self.fc == '2.6':                return 23.70            if self.fc == '3.5':                return 24.00            if self.fc == '28':                return 31.40        elif self.material == 'wood':            if self.fc == '700':                return 4.90            if self.fc == '2.6':                return 5.10            if self.fc == '3.5':                return 5.30            if self.fc == '28':                return 8.20        elif self.material == 'concrete':            if self.fc == '700':                return 7.80            if self.fc == '2.6':                return 17.00            if self.fc == '3.5':                return 23.00            if self.fc == '28':                return 38.00    def get_signal_receiving_level(self):        """        :return:  信号接收电平        """        if self.first == 'UL':            signal_receiving_level = self.transmission_power + self.antenna_gain - 2.15 - self.get_penetrate_loss() \                                     - self.get_path_loss() - 7.3 * 0.25 * 0.001 * self.d        elif self.first == 'DL':            TX_power = self.transmission_power - 10 * math.log10(self.antenna_num)            signal_receiving_level = TX_power + self.antenna_gain - 2.15 - self.get_penetrate_loss() \                                     - self.get_path_loss() - 7.3 * 0.25 * 0.001 * self.d        return signal_receiving_level    def get_actual_SINR(self):        """        :return:  实际SINR        """        if self.scs == '30':            actual_SINR = self.get_signal_receiving_level() + 174 - 10 * math.log10(30000)        elif self.scs == '60':            actual_SINR = self.get_signal_receiving_level() + 174 - 10 * math.log10(60000)        return actual_SINR    def get_theory_SINR(self):        """        :return:  理论SINR        """        if self.first == 'DL':            bit_efficiency = self.peakrate / (self.OFDM * self.symbol)            MCS = bisect_left(self.efficiency_down, bit_efficiency)            theory_SINR = 0.76 * MCS - 4.46        elif self.first == 'UL':            bit_efficiency = self.peakrate / (self.OFDM * self.symbol)            MCS = bisect_left(self.efficiency_up, bit_efficiency)            theory_SINR = 0.76 * MCS - 4.46        return theory_SINR# p = RSRP(first="D", scs="30", symbol="8:2")# # p = PeakRate(first="D", scs="30", symbol="8:2", transmission_power=30,# #              antenna_gain=1, fc='700', d=10, material='wood')# print(p.get_peakrate())# print(p.get_signal_receiving_level())# d = Delay(scs=30,Ta=1,model=3)# print(d.get_T_Ta())# print(d.get_distance())# p1 = RSRP(first="U", scs="30", symbol="7:3", peakrate=2)# print(p1.get_theory_SINR())## p2 = RSRP(first="U", scs="60", symbol="7:3", d=1000, fc='3.5', transmission_power=33, material='wood')# print(p2.get_actual_SINR())def compare_SINR():    """    :画图函数    """    # 传感器    p_sensor_theory = RSRP(first="UL", scs="30", symbol="7:3", peakrate=0.0003)    print(p_sensor_theory.get_theory_SINR())    p_sensor_actual = RSRP(first="UL", scs="30", symbol="7:3", d=153, fc='3.5', transmission_power=23,                           material='concrete')    print(p_sensor_actual.get_actual_SINR())    # 监控    p_camera_theory = RSRP(first="UL", scs="30", symbol="7:3", peakrate=80)    print(p_camera_theory.get_theory_SINR())    p_camera_actual = RSRP(first="UL", scs="30", symbol="7:3", d=78, fc='3.5', transmission_power=24,                           material='concrete')    print(p_camera_actual.get_actual_SINR())    # 手机    p_mobile_theory = RSRP(first="DL", scs="30", symbol="7:3", peakrate=200)    print(p_mobile_theory.get_theory_SINR())    p_mobile_actual = RSRP(first="DL", scs="30", symbol="7:3", d=102, fc='3.5', transmission_power=53,                           material='concrete')    print(p_mobile_actual.get_actual_SINR())    # 无人机    p_uav_theory = RSRP(first="UL", scs="30", symbol="7:3", peakrate=80)    print(p_uav_theory.get_theory_SINR())    p_uav_actual = RSRP(first="UL", scs="30", symbol="7:3", d=140, fc='3.5', transmission_power=26, material='concrete')    print(p_uav_actual.get_actual_SINR())