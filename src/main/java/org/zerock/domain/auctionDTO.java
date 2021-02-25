package org.zerock.domain;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;

@Data
@AllArgsConstructor
@Getter
public class auctionDTO {

		private int bidCnt;
		private List<aucBidVO> bid_list;
}
